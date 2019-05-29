(function ($) {
    function isTextEmpty(obj) {
        return typeof obj == "undefined" || obj == null || obj === "";
    }

    var Flyjsonedit = function (jsonedit, options) {
        this.jsonedit = jsonedit;
        this.$jsonedit = $(jsonedit);
        this.options = options;
        this.initcss();
        this.initevent();
    };

    Flyjsonedit.DEFAULTS = {
        jsonInput: undefined,
        width: "50%",
        height: "70%",
        confirm:true,
        inputs: undefined
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
        self.css("width", options.width);
        self.css("height", options.height);
        self.css("display", "none");
        var closeDialog = $('<button type="button" style="width:36px;line-height: 30px;float: right">╳</button>');
        var title = $('<div class="modal-header"><h4 class="modal-title">' + options.title + '</h4></div>');
        var footer = $('<div class="modal-footer"></div>');
        if(options.confirm) {
            var button = $('<button type="button" class="btn btn-primary">确定</button>');
            button.on('click', function (event) {
                if (options.inputIds !== undefined && options.inputIds.length > 0) {
                    var obj = {};
                    for (var i = 0; i < options.inputIds.length; i++) {
                        var value = $('#' + options.inputIds[i]).val();
                        if (!isTextEmpty(value)) {
                            obj[options.inputIds[i]] = value;
                        }
                    }
                    var jsonStr = JSON.stringify(obj);
                    if (jsonStr == "{}") {
                        options.jsonInput.val("");
                    } else {
                        options.jsonInput.val(JSON.stringify(obj));
                    }

                }
                self.trigger("confirm", options.jsonInput);
                self.fadeOut(100);
            });
            footer.append(button);
        }
        self.prepend(title.get(0))
        self.prepend(closeDialog.get(0));
        self.append(footer.get(0));
        closeDialog.on("click", function (event) {
            self.fadeOut(100);
        });

    };

    Flyjsonedit.prototype.initevent = function () {
    };

    Flyjsonedit.prototype.refresh = function () {
        try {
            if (this.options.inputIds !== undefined && this.options.inputIds.length > 0) {
                if (isTextEmpty(this.options.jsonStr)) {
                    for (var i = 0; i < this.options.inputIds.length; i++) {
                        $('#' + this.options.inputIds[i]).val("");
                    }
                } else {
                    var obj = JSON.parse(this.options.jsonStr);
                    for (var i = 0; i < this.options.inputIds.length; i++) {
                        if (!isTextEmpty(obj[this.options.inputIds[i]])) {
                            $('#' + this.options.inputIds[i]).val(obj[this.options.inputIds[i]]);
                        } else {
                            $('#' + this.options.inputIds[i]).val("");
                        }
                    }
                }
            }
        } catch (e) {
            console.log("input jsonStr parse json error!")
        }
    };

    Flyjsonedit.prototype.show = function (jsonInput, jsonStr) {
        this.options.jsonInput = jsonInput;
        this.options.jsonStr = jsonStr;
        this.$jsonedit.trigger("create");
        this.$jsonedit.fadeIn(100);
        this.refresh();
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

$(function () {
    $('.FlyJsonEdit').flyjsonedit();
});