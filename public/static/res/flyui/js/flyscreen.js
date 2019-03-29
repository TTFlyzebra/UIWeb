//获取鼠标点击区域在Html绝对位置坐标
function mouseCoords(event) {
    if (event.pageX || event.pageY) {
        return {x: event.pageX, y: event.pageY};
    }
    return {
        x: event.clientX + document.body.scrollLeft - document.body.clientLeft,
        y: event.clientY + document.body.scrollTop - document.body.clientTop
    };
}

function createCell(cell) {
    var cell_div = $('<div class="cell" cellId="' + cell.cellId + '"></div>');
    cell_div.css('position', 'absolute');
    cell_div.css('width', cell.width + 'px');
    cell_div.css('height', cell.height + 'px');
    cell_div.css('left', cell.x + 'px');
    cell_div.css('top', cell.y + 'px');
    cell.cell_div = cell_div;
    return cell_div;
}

function createCellImage(cell) {
    if (!isTextEmpty(cell.imageurl1)) {
        var image_div = $('<img>');
        image_div.css('position', 'absolute');
        image_div.css('width', cell.width + 'px');
        image_div.css('height', cell.height + 'px');
        image_div.css('left', 0 + 'px');
        image_div.css('top', 0 + 'px');
        image_div.attr('src', cell.imageurl1);
        image_div.attr('ondragstart', 'return false;');
        cell.image_div = image_div;
        return image_div;
    } else {
        return "";
    }
}

function createCellText(cell) {
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
    cell.text_div = text_div;
    return text_div;
}

function createPositionArrow(cell) {
    var cell_div = cell.cell_div;
    var positon_div = $('<div></div>');
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
    positon_div.css('position', 'absolute');
    // positon_div.css('display', 'none');
    positon_div.css('width', '100%');
    positon_div.css('height', '100%');
    positon_div.get(0).append(positiontext.get(0));
    positon_div.get(0).append(arrow_up.get(0));
    positon_div.get(0).append(arrow_down.get(0));
    positon_div.get(0).append(arrow_left.get(0));
    positon_div.get(0).append(arrow_right.get(0));
    cell.position_text_div = positiontext;
    cell.position_div = positon_div;
    return positon_div
}

function showPositionArrow(cellArr, bshow) {
    for (var i = 0; i < cellArr.length; i++) {
        cellArr[i].position_div.css('display', bshow ? 'block' : 'none');
    }
}

function createCellDel(cell) {
    var del_div = $('<div>X</div>');
    del_div.css('position', 'absolute');
    // del_div.css('display', 'none');
    del_div.css('left', (cell.width - 22) + 'px');
    del_div.css('top', '2px');
    del_div.css('width', '20px');
    del_div.css('height', '20px');
    del_div.css('background', '#FAF000');
    del_div.css('font-size', '18px');
    cell.del_div = del_div;
    return del_div;
}

function showDelete(cellArr, bshow) {
    for (var i = 0; i < cellArr.length; i++) {
        cellArr[i].del_div.css('display', bshow ? 'block' : 'none');
    }
}


function createScreenCellDiv(flyscreen, cell) {
    var cell_div = createCell(cell);
    //图像
    var image = createCellImage(cell, cell_div);
    cell_div.get(0).append(image.get(0));
    //文字
    var text = createCellText(cell, cell_div);
    cell_div.get(0).append(text.get(0));
    //位置调节
    var position = createPositionArrow(cell, cell_div);
    cell_div.get(0).append(position.get(0));
    //删除按钮
    var del = createCellDel(cell);
    cell_div.get(0).append(del.get(0));

    del.on("click", function (event) {
        flyscreen.get(0).removeChild(cell_div.get(0));
    });
    cell_div.on('mousedown', function (event) {
        Ev = event || window.event;
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
}

$.fn.flyscreen = function (option) {
    var self = this;
    var screenCellArr = [];
    var menuCellArr = [];
    var screenMoveDiv = null;
    var screenMoveDivPoint = {};
    var screenMoveCell = null;
    var bodyMoveDiv = null;
    var addMenuCell = null;
    self.css('width', option.width);
    self.css('height', option.height);
    self.innerHTML = '<div class="flyscreenmsg"></div>';
    $.ajax({
        url: option.url,
        type: "GET",
        data: "pageId=" + option.pageId,
        dataType: 'html',
        success: function (result) {
            var data = JSON.parse(result);
            for (var i = 0; i < data.cellList.length; i++) {
                var div = createScreenCellDiv(self, data.cellList[i]);
                self.append(div);
            }
        }
    });
    return this;
};
$.fn.flyscreen = function (option) {
    var self = this;
    var screenCellArr = [];
    var menuCellArr = [];
    var screenMoveDiv = null;
    var screenMoveDivPoint = {};
    var screenMoveCell = null;
    var bodyMoveDiv = null;
    var addMenuCell = null;
    self.css('width', option.width);
    self.css('height', option.height);
    self.innerHTML = '<div class="flyscreenmsg"></div>';
    $.ajax({
        url: option.url,
        type: "GET",
        data: "pageId=" + option.pageId,
        dataType: 'html',
        success: function (result) {
            var data = JSON.parse(result);
            for (var i = 0; i < data.cellList.length; i++) {
                var div = createScreenCellDiv(self, data.cellList[i]);
                self.append(div);
            }
        }
    });
    return this;
};
(function ($) {
    $.fn.flyinit = function (option) {
        var value, args = Array.prototype.slice.call(arguments, 1);
        var self = this;
        this.each(function () {
            var $this = $(this),
                data = $this.data('flyscreen'),
                options = $.extend({}, FlyScreen.DEFAULTS, $this.data(),
                    typeof option === 'object' && option);
            if (typeof option === 'string') {
                if ($.inArray(option, allowedMethods) < 0) {
                    throw new Error("Unknown method: " + option);
                }
                if (!data) {
                    return;
                }
                value = data[option].apply(data, args);
                if (option === 'destroy') {
                    $this.removeData('flyscreen');
                }
            }
            if (!data) {
                $this.data('flyscreen', (data = new FlyScreen(this, options)));
            }
        });
    };
})(jQuery);


