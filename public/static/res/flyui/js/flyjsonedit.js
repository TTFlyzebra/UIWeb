(function ($) {
    var Flyjsonedit = function (jsonedit, options) {
        this.jsonedit = jsonedit;
        this.$jsonedit = $(jsonedit);
        this.options = options;
        this.initcss();
        this.refresh();
        this.initevent();
    };

    Flyjsonedit.DEFAULTS = {
        width: "240px",
        height: "240px"
    };

    Flyjsonedit.prototype.initcss = function () {
        var self = this.$jsonedit;
        var options = this.options;
        self.css("z-index", 9999);
        self.css("position", "absolute");
        self.css("left", 0);
        self.css("right", 0);
        self.css("top", 0);
        self.css("bottom", 0);
        self.css("margin", "auto");
        self.css("border", "solid 1px #666");
        self.css("background-color", "#FFFFFF");
        self.css("box-shadow", "0 0 3px #666");
        self.css("width", "50%");
        self.css("height", "70%");
        self.css("display","none");
        var closeDialog = $('<button type="button" style="width:36px;line-height: 30px;float: right">╳</button>');
        closeDialog.on("click", function (event) {
            self.fadeOut(100);
        });
        self.prepend(closeDialog.get(0));
    };

    Flyjsonedit.prototype.initevent = function () {
        var divimg = this.divimg;
        var self = this.$jsonedit;
        var options = this.options;
        if (options.autoup === true) {
            this.$jsonedit.on("change", function () {
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

    Flyjsonedit.prototype.refresh = function () {
    };

    Flyjsonedit.prototype.show = function () {
        this.$jsonedit.fadeIn(100);
    };

    Flyjsonedit.prototype.hide = function () {
        this.$jsonedit.fadeOut(100);
    };

    var allowedMethods = [
        'refresh',
        'show',
        'hide'
    ];

    $.fn.flyjsonedit = function (option) {
        this.self = this;
        var value;
        var args = Array.prototype.slice.call(arguments, 1);
        this.each(function () {
            var $this = $(this);
            var data = $this.data('jsonedit');
            var options = $.extend({}, Flyjsonedit.DEFAULTS, $this.data(), typeof option === 'object' && option);
            if (typeof option === 'string') {
                if ($.inArray(option, allowedMethods) < 0) {
                    throw new Error("Unknown method: " + option);
                }
                if (!data) {
                    return;
                }
                value = data[option].apply(data, args);
                if (option === 'destroy') {
                    $this.removeData('jsonedit');
                }
            }
            if (!data) {
                $this.data('jsonedit', (new Flyjsonedit(this, options)));
            }
        });
        return typeof value === 'undefined' ? this : value;
    };
})(jQuery);