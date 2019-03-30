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
    //图像
    var image = childimage(cell);
    cell_div.get(0).append(image.get(0));
    //文字
    var text = childtext(cell);
    cell_div.get(0).append(text.get(0));
    //删除按钮
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

var childimage = function (cell) {
    var image_div = $('<img>');
    image_div.css('position', 'absolute');
    image_div.css('width', cell.width + 'px');
    image_div.css('height', cell.height + 'px');
    image_div.css('left', 0 + 'px');
    image_div.css('top', 0 + 'px');
    image_div.attr('src', cell.imageurl1);
    image_div.attr('ondragstart', 'return false;');
    return image_div;
};

var childtext = function (cell) {
    var text_div = $('<div></div>');
    text_div.css('position', 'absolute');
    text_div.css('text-align', 'center');
    text_div.css('width', cell.width + 'px');
    text_div.css('font-size', cell.textSize + 'px');
    text_div.css('color', cell.textColor);
    text_div.css('marginTop', (cell.height - 48) + 'px');
    try {
        var data = JSON.parse(cell.textTitle);
        var content = data.zh;
        if (content) {
            cell.textTitle = content.replace('\n', '<br/>');
        }
    } catch (e) {
    }
    if (isTextEmpty(cell.textTitle)) {
        text_div.css('marginTop', (cell.height - 36) / 2 + 'px');
        text_div.css('font-size', '24px');
    }
    text_div.get(0).innerHTML = isTextEmpty(cell.textTitle) ? cell.celltypeName : cell.textTitle;
    return text_div;
};

var childposion = function (cell, cell_div, bshow) {
    var position_div = $('<div class="position"></div>');
    var arrow_up = $('<div style="position: absolute;left:0;right:0;top: -40px;bottom: 40px;width: 24px;height: 24px;margin: auto;' +
        'border-bottom: 24px solid #FFB800;border-left: 24px solid transparent;border-right: 24px solid transparent;"></div>');

    var arrow_down = $('<div style="position: absolute;left: 0;right: 0;top: 40px;bottom: -40px;width: 24px;height: 24px;margin: auto;' +
        'border-left: 24px solid transparent;border-right: 24px solid transparent;border-top: 24px solid #FFB800;"></div>');

    var arrow_left = $('<div style="position: absolute;left: 0;right: 80px;top: -40px;bottom: -40px;width: 24px;height: 24px;margin: auto;' +
        'border-top: 24px solid transparent;border-bottom: 24px solid transparent;border-right: 24px solid #FFB800;"></div>');

    var arrow_right = $('<div style=" position: absolute;left: 80px;right: 0;top: -40px;bottom: -40px;width: 24px;height: 24px;margin: auto;' +
        'border-top: 24px solid transparent;border-bottom: 24px solid transparent;border-left: 24px solid #FFB800;"></div>');
    var positiontext = $('<div id="position" style=" position: absolute;padding-left: 2px;text-align: left;color: #FF00FF;"></div>');
    positiontext.get(0).innerHTML = cell.x + "X" + cell.y;
    arrow_up.on("click", function (event) {
        var y = trimPX(cell_div.get(0).style.top);
        cell_div.get(0).style.top = (y - 1) + 'px';
        cell.y = y - 1;
        positiontext.get(0).innerHTML = cell.x + "X" + cell.y;
    });
    arrow_down.on("click", function (event) {
        var y = trimPX(cell_div.get(0).style.top);
        cell_div.get(0).style.top = (y + 1) + 'px';
        cell.y = y + 1;
        positiontext.get(0).innerHTML = cell.x + "X" + cell.y;
    });
    arrow_left.on("click", function (event) {
        var x = trimPX(cell_div.get(0).style.left);
        cell_div.get(0).style.left = (x - 1) + 'px';
        cell.x = x - 1;
        positiontext.get(0).innerHTML = cell.x + "X" + cell.y;
    });
    arrow_right.on("click", function (event) {
        var x = trimPX(cell_div.get(0).style.left);
        cell_div.get(0).style.left = (x + 1) + 'px';
        cell.x = x + 1;
        positiontext.get(0).innerHTML = cell.x + "X" + cell.y;
    });
    position_div.css('position', 'absolute');
    position_div.css('display', bshow ? 'block' : 'none');
    position_div.css('width', '100%');
    position_div.css('height', '100%');
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
    del_div.css('position', 'absolute');
    del_div.css('display', bshow ? 'block' : 'none');
    del_div.css('left', (cell.width - 22) + 'px');
    del_div.css('top', '2px');
    del_div.css('width', '20px');
    del_div.css('height', '20px');
    del_div.css('background', '#FAF000');
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
        if(options.moveevent){
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
        moveevent:true
    };

    FlyScreen.prototype.createCellDiv = function (cell) {
        var self = this;
        var screen = this.screen;
        var cell_div = cellitem(cell);
        //图像
        var image = childimage(cell);
        cell_div.get(0).append(image.get(0));
        //文字
        var text = childtext(cell);
        cell_div.get(0).append(text.get(0));
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
            data: "jsondata=" + cellListJson + "&pageId=" + id,
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
                self.posmsg.innerHTML = x + "X" + y;
            } else {
                x = x - $(this).offset().left;
                y = y - $(this).offset().top;
            }
            self.showmsg(Math.round(x) + ',' + Math.round(y));
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
        var cell_div = $('<div class="menucell"></div>');
        cell_div.css('position', 'relative');
        cell_div.css('float', 'left');
        cell_div.css('text-align', 'center');
        cell_div.css('width', this.options.childw + 'px');
        cell_div.css('height', this.options.childh + 'px');
        cell_div.css('border', 'solid');
        cell_div.css('border-width', '1px');
        cell_div.css('border-color', '#707F00');
        //图像
        var image = $('<img>');
        image.css('position', 'absolute');
        if (isTextEmpty(cell.imageurl1) || cell.celltype === 6) {
            if (cell.width > cell.height) {
                image.attr('width', this.options.childw + 'px');
                image.attr('height', cell.height * this.options.childw / cell.width + 'px');
                image.css('left', '0px');
                image.css('top', (cell.width - cell.height) * this.options.childw / cell.width / 2 + 'px');
            } else {
                image.attr('width', cell.width * this.options.childh / cell.height + 'px');
                image.attr('height', this.options.childh + 'px');
                image.css('left', (cell.height - cell.width) * this.options.childh / cell.height / 2 + 'px');
                image.css('top', '0px')
            }
        } else if (cell.width > cell.height) {
            image.attr('width', this.options.childw + 'px');
            image.attr('height', 'auto');
            image.css('left', '0px');
            image.css('top', (cell.width - cell.height) * this.options.childw / cell.width / 2 + 'px');
        } else {
            image.attr('width', 'auto');
            image.attr('height', this.options.childh + 'px');
            image.css('left', (cell.height - cell.width) * this.options.childh / cell.height / 2 + 'px');
            image.css('top', '0px')
        }
        isTextEmpty(cell.imageurl1) || cell.celltype === 6 ? image.attr('src', this.options.defimgurl) : image.attr('src', cell.imageurl1);
        image.attr('ondragstart', 'return false;');
        cell_div.get(0).append(image.get(0));
        //文字
        var text = $('<div></div>');
        text.css('position', 'absolute');
        text.css('text-align', 'center');
        text.css('width', this.options.childw + 'px');
        text.css('top', (this.options.childh - 24) + 'px')
        text.css('font-size', '16px');
        text.css('color', '#ffffff');
        try {
            var data = JSON.parse(cell.textTitle);
            var content = data.zh;
            if (content) {
                cell.textTitle = content.replace('\n', '<br/>');
            }
        } catch (e) {
        }
        text.get(0).innerHTML = isTextEmpty(cell.textTitle) ? cell.celltypeName : cell.textTitle;
        cell_div.get(0).append(text.get(0));
        cell_div.on('mousedown', function (event) {
            //添加点击事件
            addMenuCell = cell;
        });
        return cell_div.get(0);
    };

    FlyMenu.DEFAULTS = {
        width: 380,
        height: 600,
        url: undefined,
        defimgurl: "",
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
                var data = JSON.parse(result);
                menu.empty();
                for (var i = 0; i < data.rows.length; i++) {
                    var div = self.createMenuCellDiv(data.rows[i]);
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

