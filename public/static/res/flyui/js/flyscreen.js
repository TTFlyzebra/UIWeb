//获取鼠标点击区域在Html绝对位置坐标
var mouseCoords = function (event) {
    if (event.pageX || event.pageY) {
        return {x: event.pageX, y: event.pageY};
    }
    return {
        x: event.clientX + document.body.scrollLeft - document.body.clientLeft,
        y: event.clientY + document.body.scrollTop - document.body.clientTop
    };
};

var isTextEmpty = function (obj) {
    return typeof obj == "undefined" || obj == null || obj === "";
};

var trimPX = function (_px) {
    if (_px === null || _px === "")
        return 0;
    return parseInt(_px.substr(0, _px.lastIndexOf("px")));
};

var createCellDiv = function (cell) {
    var cell_div = cellitem(cell);
    // //图像
    var image_divs = childimages(cell);
    if (image_divs.length > 0) {
        for (var i = 0; i < image_divs.length; i++) {
            cell_div.get(0).append(image_divs[i].get(0));
        }
    }
    //文字
    var text_divs = childtexts(cell);
    if (text_divs.length > 0) {
        for (var i = 0; i < text_divs.length; i++) {
            cell_div.get(0).append(text_divs[i].get(0));
        }
    }
    return cell_div.get(0);
};

var cellitem = function (cell) {
    var cell_div = $('<div class="cell" cellId="' + cell.cellId + '"></div>');
    cell_div.css('position', 'absolute');
    cell_div.css('width', cell.width + 'px');
    cell_div.css('height', cell.height + 'px');
    cell_div.css('left', cell.x + 'px');
    cell_div.css('top', cell.y + 'px');
    return cell_div;
};

var childimages = function (cell) {
    var image_divs = [];
    if (cell.images !== undefined && cell.images.length > 0) {
        for (var i = cell.images.length - 1; i >= 0; i--) {
            var imageBean = cell.images[i];
            image_divs[i] = $('<img style="position: absolute;margin: auto;">');
            image_divs[i].css('left', imageBean.left + 'px');
            image_divs[i].css('top', imageBean.top + 'px');
            image_divs[i].css('right', imageBean.right + 'px');
            image_divs[i].css('bottom', imageBean.bottom + 'px');
            image_divs[i].attr('width', Math.min(cell.width, imageBean.width) + 'px');
            image_divs[i].attr('height', Math.min(cell.height, imageBean.height) + 'px');
            image_divs[i].attr('src', imageBean.url);
            image_divs[i].attr('ondragstart', 'return false;');
        }
    } else {
        image_divs[0] = $('<img style="position: absolute;margin: auto;">');
        image_divs[0].attr('width', cell.width + 'px');
        image_divs[0].attr('height', cell.height + 'px');
        image_divs[0].attr('ondragstart', 'return false;');
    }
    return image_divs;
}

var childtexts = function (cell) {
    var text_divs = [];
    var is_settext = false;
    if (cell.texts !== undefined && cell.texts.length > 0) {
        var count = 0;
        for (var i = cell.texts.length - 1; i >= 0; i--) {
            var textBean = cell.texts[i];
            if (isTextEmpty(textBean.text)) continue;
            text_divs[count] = $('<div></div>');
            text_divs[count].css('position', 'absolute');
            text_divs[count].css('text-align', 'center');
            text_divs[count].css('width', cell.width + 'px');
            text_divs[count].css('font-size', textBean.textSize + 'px');
            text_divs[count].css('color', textBean.textColor);
            text_divs[count].css('marginTop', (cell.height - 48) + 'px');
            text_divs[count].get(0).innerHTML = isTextEmpty(textBean.text.zh_rCN) ? "" : textBean.text.zh_rCN;
            if (!is_settext) {
                is_settext = !isTextEmpty(textBean.text.zh_rCN);
            }
            count++;
        }
    }
    if (!is_settext) {
        text_divs[0] = $('<div></div>');
        text_divs[0].css('position', 'absolute');
        text_divs[0].css('text-align', 'center');
        text_divs[0].css('width', cell.width + 'px');
        text_divs[0].css('font-size', '24px');
        text_divs[0].css('color', "#000000");
        text_divs[0].css('marginTop', (cell.height / 2 - 18) + 'px');
        text_divs[0].get(0).innerHTML = isTextEmpty(cell.description) ? "" : cell.description;
    }
    return text_divs;
};

var childposion = function (cell, cell_div, bshow) {
    var position_div = $('<div class="position"></div>');
    var size_div = $('<div style="position: absolute;">' + cell.width + '-' + cell.height + '</div>');
    size_div.css('text-align', 'right');
    size_div.css('top', cell.height - 28);
    size_div.css('width', cell.width - 4);
    size_div.css('height', 24);
    size_div.css('color', '#FF00FF');
    var positiontext = $('<div id="position" style=" position: absolute;padding-left: 2px;text-align: left;color: #FF00FF;"></div>');
    positiontext.css('white-space', 'nowrap')
    positiontext.css('text-align', 'left');
    positiontext.css('minwidth', 100);
    positiontext.css('height', 24);
    positiontext.css('color', '#FF00FF');
    var arrow_up = $('<div style="opacity:0.5;position: absolute;left:0;right:0;top: -40px;bottom: 40px;width: 24px;height: 24px;margin: auto;' +
        'border-bottom: 24px solid #FFB800;border-left: 24px solid transparent;border-right: 24px solid transparent;"></div>');

    var arrow_down = $('<div style="opacity:0.5;position: absolute;left: 0;right: 0;top: 40px;bottom: -40px;width: 24px;height: 24px;margin: auto;' +
        'border-left: 24px solid transparent;border-right: 24px solid transparent;border-top: 24px solid #FFB800;"></div>');

    var arrow_left = $('<div style="opacity:0.5;position: absolute;left: -40px;right: 40px;top: -40px;bottom: -40px;width: 24px;height: 24px;margin: auto;' +
        'border-top: 24px solid transparent;border-bottom: 24px solid transparent;border-right: 24px solid #FFB800;"></div>');

    var arrow_right = $('<div style="opacity:0.5;position: absolute;left: 40px;right: -40px;top: -40px;bottom: -40px;width: 24px;height: 24px;margin: auto;' +
        'border-top: 24px solid transparent;border-bottom: 24px solid transparent;border-left: 24px solid #FFB800;"></div>');
    positiontext.get(0).innerHTML = cell.x + "-" + cell.y;
    arrow_up.on("click", function (event) {
        cell.x = trimPX(cell_div.get(0).style.left);
        var y = trimPX(cell_div.get(0).style.top);
        cell_div.get(0).style.top = (y - 1) + 'px';
        cell.y = y - 1;
        positiontext.get(0).innerHTML = cell.x + "-" + cell.y;
    });
    arrow_down.on("click", function (event) {
        cell.x = trimPX(cell_div.get(0).style.left);
        var y = trimPX(cell_div.get(0).style.top);
        cell_div.get(0).style.top = (y + 1) + 'px';
        cell.y = y + 1;
        positiontext.get(0).innerHTML = cell.x + "-" + cell.y;
    });
    arrow_left.on("click", function (event) {
        var x = trimPX(cell_div.get(0).style.left);
        cell_div.get(0).style.left = (x - 1) + 'px';
        cell.x = x - 1;
        cell.y = trimPX(cell_div.get(0).style.top);
        positiontext.get(0).innerHTML = cell.x + "-" + cell.y;
    });
    arrow_right.on("click", function (event) {
        var x = trimPX(cell_div.get(0).style.left);
        cell_div.get(0).style.left = (x + 1) + 'px';
        cell.x = x + 1;
        cell.y = trimPX(cell_div.get(0).style.top);
        positiontext.get(0).innerHTML = cell.x + "-" + cell.y;
    });
    position_div.css('position', 'absolute');
    position_div.css('display', bshow ? 'block' : 'none');
    position_div.css('width', '100%');
    position_div.css('height', '100%');
    position_div.get(0).append(size_div.get(0));
    position_div.get(0).append(positiontext.get(0));
    position_div.get(0).append(arrow_up.get(0));
    position_div.get(0).append(arrow_down.get(0));
    position_div.get(0).append(arrow_left.get(0));
    position_div.get(0).append(arrow_right.get(0));
    cell.posmsg = positiontext.get(0);
    return position_div
};

var _delete = function (cell, bshow) {
    var del_div = $('<div class="delete">X</div>');
    del_div.css('opacity', '0.5');
    del_div.css('position', 'absolute');
    del_div.css('display', bshow ? 'block' : 'none');
    del_div.css('left', (cell.width - 24) + 'px');
    del_div.css('top', '4px');
    del_div.css('width', '20px');
    del_div.css('height', '20px');
    del_div.css('background', '#00FF00');
    del_div.css('font-size', '18px');
    return del_div;
};

(function ($) {
    var FlyScreen = function (screen, options) {
        this.screen = screen;
        this.$srceen = $(screen);
        this.options = options;
        this.initcss();
        this.initevent();
        this.refresh();
        if (options.moveevent) {
            this.screenclicklisenter();
        }
    };

    FlyScreen.DEFAULTS = {
        width: 1024,
        height: 600,
        pageId: undefined,
        url: undefined,
        defimgurl: "",
        showdelete: $('.showdelete').prop('checked'),
        showadjust: $('.showadjust').prop('checked'),
        moveevent: true
    };

    FlyScreen.prototype.createCellDiv = function (cell) {
        var self = this;
        var screen = this.screen;
        var cell_div = cellitem(cell);
        // //图像
        var image_divs = childimages(cell);
        if (image_divs.length > 0) {
            for (var i = 0; i < image_divs.length; i++) {
                cell_div.get(0).append(image_divs[i].get(0));
            }
        }
        //文字
        var text_divs = childtexts(cell);
        if (text_divs.length > 0) {
            for (var i = 0; i < text_divs.length; i++) {
                cell_div.get(0).append(text_divs[i].get(0));
            }
        }
        //位置调节
        var position = childposion(cell, cell_div, this.options.showadjust);
        cell_div.get(0).append(position.get(0));
        //删除按钮
        var del = _delete(cell, this.options.showdelete);
        cell_div.get(0).append(del.get(0));

        del.on("click", function (event) {
            screen.removeChild(cell_div.get(0));
        });
        cell_div.on('mousedown', function (event) {
            // Ev = event || window.event;
            //鼠标点击的绝对位置
            var mousePos = mouseCoords(event);
            var x = mousePos.x;
            var y = mousePos.y;
            //获取div在body中的绝对位置
            var x1 = this.offsetLeft;
            var y1 = this.offsetTop;
            //鼠标点击位置相对于div的坐标
            var x2 = x - x1;
            var y2 = y - y1;
            self.movePos = {x: x2, y: y2};
            if (!self.moveMuneCell) {
                self.moveCell = cell_div.get(0);
                self.posmsg = cell.posmsg;
            } else {
                self.moveCell = null;
                self.posmsg = null;
            }
        });
        return cell_div.get(0);
    };

    FlyScreen.prototype.initcss = function () {
        $(document.body).css("font-size", "20px");
        $(document.body).css("-webkit-user-select", "none");
        $(document.body).css("-moz-user-select", "none");
        $(document.body).css("-ms-user-select", "none");
        $(document.body).css("user-select", "none");
        this.$srceen.css("position", "relative");
        this.$srceen.css("float", "left");
        this.$srceen.css("overflow", "auto");
        this.$srceen.css("background", "#1b6d85");
        this.$srceen.css("width", this.options.width);
        this.$srceen.css("height", this.options.height);
        var flycontent = $('.flycontent');
        flycontent.css("margin", "auto");
        flycontent.css("background", "lightsteelblue");
        flycontent.css("width", this.options.width);
        var flycontrl = $('.flycontrl');
        flycontrl.css("display", "table-cell");
        flycontrl.css("vertical-align", "middle");
        flycontrl.css("width", this.options.width);
        flycontrl.css("height", "60px");
    };

    FlyScreen.prototype.initevent = function () {
        var self = this;
        $('.screenrefresh').click(function () {
            self.refresh();
        });

        $('.screensave').click(function () {
            self.save();
        });

        $('.showdelete').change(function () {
            self.showdelete($(this).prop('checked'));
        });

        $('.showadjust').change(function () {
            self.showadjust($(this).prop('checked'));
        });
    };

    FlyScreen.prototype.refresh = function (id) {
        if (!id) {
            id = this.options.pageId;
        }
        var self = this;
        var screen = this.$srceen;
        $.ajax({
            url: this.options.url,
            type: "GET",
            data: "pageId=" + id,
            dataType: 'html',
            success: function (result) {
                var obj = JSON.parse(result);
                if (obj.code === 0) {
                    screen.empty();
                    screen.append($('<div id="screenmsg" ' +
                        'style="text-align: right;float: left;width: 100%;' +
                        'position: relative;font-size: 24px;color: #FF00FF;">' +
                        '</div>'));
                    for (var i = 0; i < obj.data.length; i++) {
                        var div = self.createCellDiv(obj.data[i]);
                        screen.append(div);
                    }
                } else {
                    alert(obj.msg);
                }
            }
        });
    };

    FlyScreen.prototype.save = function (id) {
        var self = this;
        if (!id) {
            id = this.options.pageId;
        }
        var cellList = $(".cell");
        var cellArr = [];
        for (var i = 0; i < cellList.length; i++) {
            var cell = {};
            cell.cellId = cellList[i].getAttribute('cellId')
            cell.x = trimPX(cellList[i].style.left);
            cell.y = trimPX(cellList[i].style.top);
            cell.width = trimPX(cellList[i].style.width);
            cell.height = trimPX(cellList[i].style.height);
            cellArr[i] = cell;
        }
        var cellListJson = JSON.stringify(cellArr);
        $.ajax({
            url: this.options.url,
            type: "POST",
            data: {jsondata: cellListJson, pageId: id},
            dataType: 'html',
            error: function (request) {
                alert("向服务器提交页面数据更新失败!");
            },
            success: function (result) {
                var obj = JSON.parse(result);
                self.showmsg(obj.code === 0 ? "save ok" : obj.msg);
            }
        });
    };

    FlyScreen.prototype.showmsg = function (text) {
        var screenmsg = $('#screenmsg').get(0);
        if (screenmsg) {
            screenmsg.innerHTML = text;
        }
    };

    FlyScreen.prototype.screenclicklisenter = function () {
        var self = this;
        var screen = this.$srceen;
        screen.on('mousemove', function (event) {
            var x = event.clientX;
            var y = event.clientY;
            if (self.moveCell) {
                x = x - self.movePos.x;
                y = y - self.movePos.y;
                self.moveCell.style.left = x + 'px';
                self.moveCell.style.top = y + 'px';
                self.posmsg.innerHTML = x + "-" + y;
            } else {
                x = x - $(this).offset().left;
                y = y - $(this).offset().top;
            }
            self.showmsg(Math.round(x) + '-' + Math.round(y));
        }).on('mouseup', function (event) {
            self.moveCell = null;
            self.posmsg = null;
        });
    };

    FlyScreen.prototype.showdelete = function (bshow) {
        this.options.showdelete = bshow;
        var list = $(".delete");
        for (var i = 0; i < list.length; i++) {
            $(list[i]).css('display', bshow ? 'block' : 'none');
        }
    };

    FlyScreen.prototype.showadjust = function (bshow) {
        this.options.showadjust = bshow;
        var list = $(".position");
        for (var i = 0; i < list.length; i++) {
            $(list[i]).css('display', bshow ? 'block' : 'none');
        }
    };

    FlyScreen.prototype.addcell = function (cell) {
        var div = this.createCellDiv(cell);
        this.screen.append(div);
    };

    var allowedMethods = [
        'eventinit',
        'refresh',
        'save',
        'showmsg',
        'showdelete',
        'showadjust',
        'addcell'
    ];

    $.fn.screen = function (option) {
        this.self = this;
        var value;
        var args = Array.prototype.slice.call(arguments, 1);
        this.each(function () {
            var $this = $(this);
            var data = $this.data('screen');
            var options = $.extend({}, FlyScreen.DEFAULTS, $this.data(), typeof option === 'object' && option);
            if (typeof option === 'string') {
                if ($.inArray(option, allowedMethods) < 0) {
                    throw new Error("Unknown method: " + option);
                }
                if (!data) {
                    return;
                }
                value = data[option].apply(data, args);
                if (option === 'destroy') {
                    $this.removeData('screen');
                }
            }
            if (!data) {
                $this.data('screen', (new FlyScreen(this, options)));
            }
        });
        return typeof value === 'undefined' ? this : value;
    };
})(jQuery);

(function ($) {
    var bodyMoveDiv = null;
    var addMenuCell = null;
    var FlyMenu = function (menu, options) {
        this.menu = menu;
        this.$menu = $(menu);
        this.options = options;
        this.initcss();
        this.refresh();
        this.initevent();
    };

    FlyMenu.prototype.createMenuCellDiv = function (cell) {
        var scalew = cell.width / (this.options.childw - 4);
        var scaleh = cell.height / (this.options.childh - 4);
        var scale = scalew > scaleh ? scalew : scaleh;
        var menucell_div = $('<div style=" position:relative;float:left;text-align:center;' +
            'width:' + this.options.childw + 'px;height:' + this.options.childh + 'px;' +
            'border:solid;border-width:1px;border-color:#707F00;"></div>');
        menucell_div.css('width', this.options.childw + 'px');
        menucell_div.css('height', this.options.childh + 'px');
        var menucell = $('<div style="position: absolute;left:0;right:0;top:0;bottom:0;margin: auto;' +
            'border-width;0px;background:#000000;background-color:rgba(0,0,0,0.1);"></div>');
        menucell.css('width', cell.width / scale + 'px');
        menucell.css('height', cell.height / scale + 'px');
        menucell_div.get(0).append(menucell.get(0));
        //添加所有图像
        if (cell.images !== undefined && cell.images.length > 0) {
            for (var i = cell.images.length - 1; i >= 0; i--) {
                var obj = cell.images[i];
                var image = $('<img style="position: absolute;margin: auto;">');
                image.css('left', obj.left / scale + 'px');
                image.css('top', obj.top / scale + 'px');
                image.css('right', obj.right / scale + 'px');
                image.css('bottom', obj.bottom / scale + 'px');
                image.attr('width', Math.min(cell.width, obj.width) / scale + 'px');
                image.attr('height', Math.min(cell.height, obj.height) / scale + 'px');
                image.attr('src', obj.url);
                image.attr('ondragstart', 'return false;');
                menucell.get(0).append(image.get(0));
            }
        }
        //控件描述
        var text = $('<div style="position: absolute;text-align:center;font-size:14px;color:#FFFFFF;' +
            'width: ' + this.options.childw + 'px;top:' + (this.options.childh - 24) + 'px;' +
            '">' + cell.description + '</div>');
        menucell_div.get(0).append(text.get(0));
        menucell_div.on('mousedown', function (event) {
            //添加点击事件
            addMenuCell = cell;
        });
        return menucell_div.get(0);
    };

    FlyMenu.DEFAULTS = {
        width: 380,
        height: 600,
        url: undefined,
        defimgurl: "./default_cellmenu.png",
        childw: 120,
        childh: 120
    };


    FlyMenu.prototype.initcss = function () {
        this.$menu.css("position", "relative");
        this.$menu.css("float", "left");
        this.$menu.css("overflow-y", "scroll");
        this.$menu.css("background", "#009688");
        this.$menu.css("width", this.options.width);
        this.$menu.css("height", this.options.height);
        var flycontent = $('.flycontent');
        flycontent.css("width", flycontent.width() + this.options.width);
        var flycontrl = $('.flycontrl');
        flycontrl.css("width", flycontent.width() + this.options.width);

    };

    FlyMenu.prototype.refresh = function (searchStr) {
        var self = this;
        var menu = this.$menu;
        $.ajax({
            url: this.options.url,
            type: "GET",
            data: searchStr,
            dataType: 'html',
            success: function (result) {
                var obj = JSON.parse(result);
                var data = obj.data;
                menu.empty();
                for (var i = 0; i < data.length; i++) {
                    var div = self.createMenuCellDiv(data[i]);
                    menu.append(div);
                }
            }
        });
    };

    FlyMenu.prototype.initevent = function () {
        $(document).on('mousemove', function (event) {
            if (addMenuCell) {
                if (bodyMoveDiv === null) {
                    bodyMoveDiv = createCellDiv(addMenuCell);
                    document.body.appendChild(bodyMoveDiv);
                }
                bodyMoveDiv.style.left = (event.clientX - addMenuCell.width / 2) + 'px';
                bodyMoveDiv.style.top = (event.clientY - addMenuCell.height / 2) + 'px';
            }
        }).on('mouseleave', function (event) {
            if (bodyMoveDiv) {
                document.body.removeChild(bodyMoveDiv);
                bodyMoveDiv = null;
            }
            if (addMenuCell) {
                addMenuCell = null;
            }
        }).on('mouseup', function (event) {
            var flyscreen = $('.flyscreen');
            var left = flyscreen.offset().left;
            var top = flyscreen.offset().top;
            var width = flyscreen.width();
            var height = flyscreen.height();
            if (event.clientX >= left
                && event.clientX <= (width + left) && event.clientY >= top && event.clientY <= (height + top)) {
                if (addMenuCell) {
                    var x = event.clientX - addMenuCell.width / 2 - left + flyscreen.get(0).scrollLeft;
                    var y = event.clientY - addMenuCell.height / 2 - top + flyscreen.get(0).scrollTop;
                    addMenuCell.x = Math.round(x);
                    addMenuCell.y = Math.round(y);
                    flyscreen.screen("addcell", addMenuCell);
                }
            }
            if (bodyMoveDiv) {
                bodyMoveDiv.remove();
                bodyMoveDiv = null;
            }
            if (addMenuCell) {
                addMenuCell = null;
            }
        });

    };

    var allowedMethods = [
        'refresh'
    ];

    $.fn.menu = function (option) {
        this.self = this;
        var value;
        var args = Array.prototype.slice.call(arguments, 1);
        this.each(function () {
            var $this = $(this);
            var data = $this.data('menu');
            var options = $.extend({}, FlyMenu.DEFAULTS, $this.data(), typeof option === 'object' && option);
            if (typeof option === 'string') {
                if ($.inArray(option, allowedMethods) < 0) {
                    throw new Error("Unknown method: " + option);
                }
                if (!data) {
                    return;
                }
                value = data[option].apply(data, args);
                if (option === 'destroy') {
                    $this.removeData('menu');
                }
            }
            if (!data) {
                $this.data('menu', (new FlyMenu(this, options)));
            }
        });
        return typeof value === 'undefined' ? this : value;
    };
})(jQuery);


(function ($) {
    var FlyPage = function (page, options) {
        this.page = page;
        this.$page = $(page);
        this.options = options;
        this.initcss();
        this.refresh();
        this.initevent();
    };

    FlyPage.DEFAULTS = {
        width: 380,
        height: 600,
        url: undefined
    };

    FlyPage.prototype.initcss = function () {
        this.$page.css("position", "relative");
        this.$page.css("float", "left");
        this.$page.css("overflow-y", "scroll");
        this.$page.css("background", "#009688");
        this.$page.css("width", this.options.width);
        this.$page.css("height", this.options.height);
        var flycontent = $('.flycontent');
        flycontent.css("width", flycontent.width() + this.options.width);
        var flycontrl = $('.flycontrl');
        flycontrl.css("width", flycontent.width() + this.options.width);

    };

    FlyPage.prototype.refresh = function (searchStr) {
    };

    FlyPage.prototype.initevent = function () {

    };

    var allowedMethods = [
        'refresh'
    ];

    $.fn.page = function (option) {
        this.self = this;
        var value;
        var args = Array.prototype.slice.call(arguments, 1);
        this.each(function () {
            var $this = $(this);
            var data = $this.data('page');
            var options = $.extend({}, FlyPage.DEFAULTS, $this.data(), typeof option === 'object' && option);
            if (typeof option === 'string') {
                if ($.inArray(option, allowedMethods) < 0) {
                    throw new Error("Unknown method: " + option);
                }
                if (!data) {
                    return;
                }
                value = data[option].apply(data, args);
                if (option === 'destroy') {
                    $this.removeData('page');
                }
            }
            if (!data) {
                $this.data('page', (new FlyPage(this, options)));
            }
        });
        return typeof value === 'undefined' ? this : value;
    };
})(jQuery);

