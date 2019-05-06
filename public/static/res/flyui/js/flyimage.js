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
            //
            // var divurl = $('<div style="width: 100%;"><span style="line-height:30px;float: left;vertical-align:middle;">图片地址：</span></div>')
            // var divauto1 = $('<div style="overflow:hidden" ></div>');
            // var imageurl = $('<input style="width: 100%;height: 30px" type="text" name="imageurl[]" value="">');
            // this.imageurl = imageurl;
            // divauto1.append(imageurl);
            // divurl.append(divauto1);
            // self.after(divurl);
            //
            // var divwh = $('<div style="width: 100%"></div>');
            // var divwidth = $('<div style="width: 50%;float: left"><span style="line-height:30px;float: left;vertical-align:middle;">宽：</span></div>')
            // var divauto2 = $('<div style="overflow: hidden"></div>');
            // var imagew = $('<input style="width: 100%;height: 30px" type="text" name="imagew[]" value="">');
            // this.imagew = imagew;
            // divauto2.append(imagew);
            // divwidth.append(divauto2);
            // divwh.append(divwidth);
            // var divheight = $('<div style="width: 50%;float: left"><span style="line-height:30px;float: left;vertical-align:middle;">高：</span></div>')
            // var divauto3 = $('<div style="overflow: hidden"></div>');
            // var imageh = $('<input style="width: 100%;height: 30px" type="text" name="imageh[]" value="">');
            // this.imageh = imageh;
            // divauto3.append(imageh);
            // divheight.append(divauto3);
            // divwh.append(divheight);
            // self.after(divwh);

            var divparent = $('<div style="display: flex;align-items:center;justify-content:center;overflow:hidden;width:' +
                options.width + ';height:' + options.height + ';background:#0f0f0f"></div>');
            divparent.on('click', function () {
                self.click();
            });
            var divimg = $('<img style="max-width: ' + options.width + ';max-height:' + options.height + ';width: auto;height: auto"  alt="">');
            divimg.attr('src', options.image);
            divparent.append(divimg);
            this.divimg = divimg;
            self.after(divparent);

            var del = $('<div style="cursor:pointer;position:absolute;right:16px;top:1px;' +
                'width: 28px;heidth:28px;font-size: 20px;color:#000000;background: #FFFFFF">&nbsp;X</div>');
            del.on("click", function (event) {
                divimg.attr('src', "");
                imageurl.val("");
                imagew.val("");
                imageh.val(obj.data.height);
                self.trigger("del", event);
            });
            self.after(del);
        }
    };

    FlyImage.prototype.initevent = function () {
        var divimg = this.divimg;
        var imageurl = this.imageurl;
        var imagew = this.imagew;
        var imageh = this.imageh;
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
                        try {
                            var obj = JSON.parse(result);
                            if (obj.code === 0) {
                                divimg.attr('src', obj.data.saveName);
                                imageurl.val(obj.data.saveName);
                                imagew.val(obj.data.width);
                                imageh.val(obj.data.height);
                            } else {
                                divimg.attr('src', options.image);
                                alert(obj.msg + "data" + obj.data);
                            }
                        } catch (e) {
                            divimg.attr('src', options.image);
                            alert("catch error:" + e);
                        }
                        self.trigger("success", result);
                    },
                    error: function (result) {
                        divimg.attr('src', options.image);
                        alert("上传图片失败！");
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