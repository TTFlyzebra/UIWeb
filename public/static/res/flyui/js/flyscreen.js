(function ($) {
    var FlyScreen = function (screen, options) {
        this.screen = screen;
        this.$srceen = $(screen);
        this.options = options;
        this.init();
        this.refresh();
        this.eventinit();
    };

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
        if (!isTextEmpty(cell.imageurl1)) {
            var image_div = $('<img>');
            image_div.css('position', 'absolute');
            image_div.css('width', cell.width + 'px');
            image_div.css('height', cell.height + 'px');
            image_div.css('left', 0 + 'px');
            image_div.css('top', 0 + 'px');
            image_div.attr('src', cell.imageurl1);
            image_div.attr('ondragstart', 'return false;');
            return image_div;
        } else {
            return "";
        }
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

    var childposion = function (cell,bshow) {
        var cell_div = cell.cell_div;
        var position_div = $('<div class="position"></div>');
        var arrow_up = $('<div style="position: absolute;left:0;right:0;top: 0;bottom: 80px;width: 24px;height: 24px;margin: auto;' +
            'border-bottom: 24px solid #FFB800;border-left: 24px solid transparent;border-right: 24px solid transparent;"></div>');
        var arrow_down = $('<div style="position: absolute;top: 80px;bottom: 0;left: 0;right: 0;width: 24px;height: 24px;margin: auto;' +
            'border-left: 24px solid transparent;border-right: 24px solid transparent;border-top: 24px solid #FFB800;"></div>');
        var arrow_left = $('<div style="position: absolute;top: 0;bottom: 0;left: 0;right: 80px;width: 24px;height: 24px;margin: auto;' +
            'border-top: 24px solid transparent;border-bottom: 24px solid transparent;border-right: 24px solid #FFB800;"></div>');
        var arrow_right = $('<div style=" position: absolute;top: 0;bottom: 0;left: 80px;right: 0;width: 24px;height: 24px;margin: auto;' +
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
        position_div.css('display', bshow?'block':'none');
        position_div.css('width', '100%');
        position_div.css('height', '100%');
        position_div.get(0).append(positiontext.get(0));
        position_div.get(0).append(arrow_up.get(0));
        position_div.get(0).append(arrow_down.get(0));
        position_div.get(0).append(arrow_left.get(0));
        position_div.get(0).append(arrow_right.get(0));
        cell.position_text_div = positiontext;
        cell.position_div = position_div;
        return position_div
    };

    var _delete = function (cell,bshow) {
        var del_div = $('<div class="delete">X</div>');
        del_div.css('position', 'absolute');
        del_div.css('display', bshow?'block':'none');
        del_div.css('left', (cell.width - 22) + 'px');
        del_div.css('top', '2px');
        del_div.css('width', '20px');
        del_div.css('height', '20px');
        del_div.css('background', '#FAF000');
        del_div.css('font-size', '18px');
        cell.del_div = del_div;
        return del_div;
    };

    FlyScreen.DEFAULTS = {
        width: 1024,
        height: 600,
        pageId: undefined,
        url: undefined,
        onRefresh: function () {
            return false;
        }
    };

    FlyScreen.prototype.createCellDiv = function (cell) {
        var screen = this.screen;
        var cell_div = cellitem(cell);
        //图像
        var image = childimage(cell);
        cell_div.get(0).append(image.get(0));
        //文字
        var text = childtext(cell);
        cell_div.get(0).append(text.get(0));
        //位置调节
        var position = childposion(cell, this.options.showarrow);
        cell_div.get(0).append(position.get(0));
        //删除按钮
        var del = _delete(cell,this.options.showdelete);
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
            if (addMenuCell === null) {
                screenMoveCell = cell;
                screenMoveDiv = cell_div.get(0);
                screenMoveDivPoint.x = x2;
                screenMoveDivPoint.y = y2;
            }
        });
        return cell_div.get(0);
    };

    FlyScreen.prototype.init = function () {
        this.$srceen.css("width", this.options.width);
        this.$srceen.css("height", this.options.height);
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

    FlyScreen.prototype.eventinit = function () {
        var self = this;
        var screen = this.$srceen;
        screen.on('mousemove', function (event) {
            var x = event.clientX;
            var y = event.clientY;
            if (screenMoveCell) {
                x = x - screenMoveDivPoint.x;
                y = y - screenMoveDivPoint.y;
                screenMoveCell.x = x;
                screenMoveCell.y = y;
                screenMoveDiv.style.left = x + 'px';
                screenMoveDiv.style.top = y + 'px';
                screenMoveCell.position_text_div.get(0).innerHTML = x + "X" + y;
            } else {
                x = x - $(this).offset().left;
                y = y - $(this).offset().top;
            }
            self.showmsg(Math.round(x) + ',' + Math.round(y));
        }).on('mouseup', function (event) {
            if (screenMoveDiv) {
                screenMoveDiv = null;
            }
            if (screenMoveCell) {
                screenMoveCell = null;
            }
        });
    };

    FlyScreen.prototype.showdelete = function (bshow) {
        this.options.showdelete = bshow;
        var list = $(".delete");
        for (var i = 0; i < list.length; i++) {
            $(list[i]).css('display', bshow ? 'block' : 'none');
        }
    };

    FlyScreen.prototype.showarrow = function (bshow) {
        this.options.showarrow = bshow;
        var list = $(".position");
        for (var i = 0; i < list.length; i++) {
            $(list[i]).css('display', bshow ? 'block' : 'none');
        }
    };

    var allowedMethods = [
        'eventinit',
        'refresh',
        'save',
        'showmsg',
        'showdelete',
        'showarrow'
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


