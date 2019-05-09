(function ($) {
    function verify(value) {
        return value === undefined ? "" : value;
    }

    var FlyImageInput = function (FlyImageInput, options) {
        this.FlyImageInput = FlyImageInput;
        this.$FlyImageInput = $(FlyImageInput);
        this.options = options;
        this.options.num = verify(this.$FlyImageInput.attr("num"));
        this.options.subnum = verify(this.$FlyImageInput.attr("subnum"));
        this.options.imageUrl = verify(this.$FlyImageInput.attr("imageUrl"));
        this.options.imageWidth = verify(this.$FlyImageInput.attr("imageWidth"));
        this.options.imageHeight = verify(this.$FlyImageInput.attr("imageHeight"));
        this.initcss();
        this.refresh();
        this.initevent();
    };

    FlyImageInput.DEFAULTS = {
        ajaxurl: undefined,
        autoup: true,
        showView: true,
        postData: true,
        imageUrl: "",
        imageWidth: "",
        imageHeight: "",
        width: "100%",
        height: "240px"
    };

    FlyImageInput.prototype.initcss = function () {
        var self = this.$FlyImageInput;
        var options = this.options;
        if (options.postData) {
            var imageSize_div = $('<div style="width:' + options.width + ';">');
            var imageWidth_div = $(
                '<div style="margin:2px 0px 2px 0px;width:33%;height:30px;float: left;">' +
                '   <span style="width:80px;line-height:30px;vertical-align:middle;font-size: 15px">图片高度：</span>\n' +
                '</div>');
            var imageWidth = $('<input name="' + options.num + '_imageWidth[]" value="' + options.imageWidth +
                '"  style="width: calc(100% - 90px);height: 30px;border-width: 1px;border-color: #EFEFEF;" type="text" readonly>');
            this.imageWidth = imageWidth;
            imageWidth_div.append(imageWidth);

            var imageHeight_div = $(
                '<div style="margin:2px 0px 2px 0px;width:33%;height:30px;float: left;">' +
                '   <span style="width:80px;line-height:30px;vertical-align:middle;font-size: 15px">图片高度：</span>\n' +
                '</div>');
            var imageHeight = $('<input name="' + options.num + '_imageHeight[]" value="' + options.imageHeight +
                '" style="width: calc(100% - 90px);height: 30px;border-width: 1px;border-color: #EFEFEF;" type="text" readonly>');
            this.imageHeight = imageHeight;
            imageHeight_div.append(imageHeight);

            imageSize_div.append(imageWidth_div);
            imageSize_div.append(imageHeight_div);
            self.after(imageSize_div);
        }
        if (options.showView) {
            self.css("display", "none");
            var image_div = $('<div style="margin 0 30px 0 30px;display: flex;align-items:center;justify-content:center;overflow:hidden;width:' +
                options.width + ';height:' + options.height + ';background:#9F9F9F"></div>');
            image_div.on('click', function () {
                self.click();
            });
            var image = $('<img style="max-width: ' + options.width + ';max-height:' + options.height + ';width: auto;height: auto"  alt="">');
            image.attr('src', options.imageUrl);
            image_div.append(image);
            this.image = image;
            self.after(image_div);
        }

        if (options.postData) {
            var imageurl_div = $(
                '<div style="margin:2px 2px 2px 2px;width:calc(100% - 40px);height:32px;float: left;">' +
                '   <span style="width:80px;line-height:30px;vertical-align:middle;font-size: 15px">图片地址：</span>\n' +
                '</div>');
            var imageurl = $('<input name="' + options.num + '_imageUrl[]" value="' + options.imageUrl +
                '"  style="width: calc(100% - 90px);height: 30px;border-width: 1px;border-color: #EFEFEF;" type="text" readonly>');
            this.imageurl = imageurl;
            imageurl_div.append(imageurl);
            self.after(imageurl_div);
        }

        var del = $('<button  id="imageDel_'+options.num+'_'+options.subnum+'" type="button" style="width:36px;line-height: 30px;float: right">╳</button>');
        del.on("click", function (event) {
            image.attr('src', "");
            if (options.postData) {
                imageurl.val("");
                imageWidth.val("");
                imageHeight.val("");
            }
            var data = {event: event, num: options.num, subnum: options.subnum};
            self.trigger("del", data);
        });
        self.after(del);
    };

    FlyImageInput.prototype.initevent = function () {
        var image = this.image;
        var imageurl = this.imageurl;
        var imageWidth = this.imageWidth;
        var imageHeight = this.imageHeight;
        var self = this.$FlyImageInput;
        var options = this.options;
        if (options.autoup === true) {
            this.$FlyImageInput.on("change", function () {
                var formData = new FormData();
                formData.append(this.name, this.files[0]);
                $.ajax({
                    url: options.ajaxurl,
                    type: "POST",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        try {
                            var obj = JSON.parse(result);
                            if (obj.code === 0) {
                                image.attr('src', obj.data.saveName);
                                if (options.postData) {
                                    imageurl.val(obj.data.saveName);
                                    imageWidth.val(obj.data.width);
                                    imageHeight.val(obj.data.height);
                                }
                                obj.data.num = options.num;
                                obj.data.subnum = options.subnum;
                                self.trigger("success", obj.data);
                            } else {
                                alert(obj.msg + "data" + obj.data);
                            }
                        } catch (e) {
                            alert("catch error:" + e);
                        }
                    },
                    error: function (result) {
                        alert("上传图片失败！");
                    }
                });
            });
        }
    };

    FlyImageInput.prototype.refresh = function (searchStr) {
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
            var data = $this.data('FlyImageInput');
            var options = $.extend({}, FlyImageInput.DEFAULTS, $this.data(), typeof option === 'object' && option);
            if (typeof option === 'string') {
                if ($.inArray(option, allowedMethods) < 0) {
                    throw new Error("Unknown method: " + option);
                }
                if (!data) {
                    return;
                }
                value = data[option].apply(data, args);
                if (option === 'destroy') {
                    $this.removeData('FlyImageInput');
                }
            }
            if (!data) {
                $this.data('FlyImageInput', (new FlyImageInput(this, options)));
            }
        });
        return typeof value === 'undefined' ? this : value;
    };
})(jQuery);

$(function () {
    $('.FlyImageInput').flyinput({
        ajaxurl: "/uiweb/api/imagefile",
        postData: true,
        width: "100%",
        height: "400px"
    }).bind("success", function (e, data) {
    }).bind("del", function (e) {
    });
});