(function ($) {
    var FlyImage = function (flyimage, options) {
        this.flyimage = flyimage;
        this.$flyimage = $(flyimage);
        this.options = options;
        this.initcss();
        this.refresh();
        this.initevent();
    };

    FlyImage.DEFAULTS = {
        url: undefined,
        autoup: true,
        showPreview: true,
        image: undefined,
        width: "240px",
        height: "240px"
    };

    FlyImage.prototype.initcss = function () {
        var self = this.$flyimage;
        var options = this.options;
        if (options.showPreview) {
            self.css("display", "none");
            var divparent = $('<div onclick="" style="display: flex;align-items:center;justify-content:center;overflow:hidden;width:' +
                options.width + ';height:' + options.height + ';background:#0f0f0f"></div>');
            divparent.on('click', function () {
                self.click();
            });
            var divimg = $('<img style="max-width: ' + options.width + ';max-height:' + options.height + ';width: auto;height: auto"  alt="">');
            divimg.attr('src', options.image);
            divparent.append(divimg);
            this.divimg = divimg;
            var del = $('<div style="cursor:pointer;position:absolute;right:16px;top:1px;' +
                'width: 28px;heidth:28px;font-size: 20px;color:#000000;background: #FFFFFF">&nbsp;X</div>');
            del.on("click", function (event) {
                divimg.attr('src', "");
                self.trigger("del", event);
            });
            self.after(divparent);
            self.after(del);
        }
    };

    FlyImage.prototype.initevent = function () {
        var divimg = this.divimg;
        var self = this.$flyimage;
        var options = this.options;
        if (options.autoup === true) {
            this.$flyimage.on("change", function () {
                var formData = new FormData();
                formData.append(this.name, this.files[0]);
                $.ajax({
                    url: options.url,
                    type: "POST",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        self.trigger("success", result);
                        try {
                            var obj = JSON.parse(result);
                            if (obj.code === 0) {
                                divimg.attr('src', obj.data.saveName);
                            } else {
                                divimg.attr('src', options.image);
                                alert(obj.msg + "data" + obj.data);
                            }
                        } catch (e) {
                            divimg.attr('src', options.image);
                            alert("catch error:" + e);
                        }
                    },
                    error: function (result) {
                        alert("上传图片失败！");
                        divimg.attr('src', options.image);
                    }
                });
            });
        }
    };

    FlyImage.prototype.refresh = function (searchStr) {
    };

    var allowedMethods = [
        'refresh'
    ];

    $.fn.flyinput = function (option) {
        this.self = this;
        var value;
        var args = Array.prototype.slice.call(arguments, 1);
        this.each(function () {
            var $this = $(this);
            var data = $this.data('flyimage');
            var options = $.extend({}, FlyImage.DEFAULTS, $this.data(), typeof option === 'object' && option);
            if (typeof option === 'string') {
                if ($.inArray(option, allowedMethods) < 0) {
                    throw new Error("Unknown method: " + option);
                }
                if (!data) {
                    return;
                }
                value = data[option].apply(data, args);
                if (option === 'destroy') {
                    $this.removeData('flyimage');
                }
            }
            if (!data) {
                $this.data('flyimage', (new FlyImage(this, options)));
            }
        });
        return typeof value === 'undefined' ? this : value;
    };
})(jQuery);

$(function(){
    $('.flyimage').flyinput({
        url: "/uiweb/api/imagefile",
        autoup: true,
        showPreview: true,
        width: "100%",
        height: "240px"
    }).bind("success", function (e, data) {
    }).bind("del",function (e) {
    });
});