var screenCellArr = [];
var menuCellArr = [];
var moveCell = null;
var moveDiv = null;
var addCell = null;

/**
 * 将以"px"字符串结尾的字符串转换成int整数
 * @param _px 以"px"结尾的字符串
 * @returns 去掉"px"后转换的int整数
 */
function trimPX(_px) {
    if (_px === null || _px === "")
        return 0;
    return parseInt(_px.substr(0, _px.lastIndexOf("px")));
}


/**
 * @param cell
 * @returns {*|jQuery|HTMLElement}
 */
function cellDiv(cell) {
    var div = $('<div></div>');
    switch (cell.type) {
        case 11:
            break;
        default:
            div.css('position', 'absolute');
            div.css('width', cell.width * 1280 / 1920 + 'px');
            div.css('height', cell.height * 1280 / 1920 + 'px');
            div.css('left', cell.x * 1280 / 1920 + 'px');
            div.css('top', cell.y * 1280 / 1920 + 'px');
            div.css('background', '#efefff');
            //图像
            var image = $('<img>');
            image.css('position', 'absolute');
            image.css('width', cell.width * 1280 / 1920 + 'px');
            image.css('height', cell.height * 1280 / 1920 + 'px');
            image.css('left', 0 + 'px');
            image.css('top', 0 + 'px');
            image.attr('src', cell.imgUrl);
            image.attr('ondragstart', 'return false;');
            div.get(0).append(image.get(0));
            //文字
            var text = $('<div></div>');
            text.css('position', 'absolute');
            text.css('text-align', 'center');
            text.css('width', cell.width * 1280 / 1920 + 'px');
            text.css('font-size', '24px');
            text.css('top', (cell.height * 1280 / 1920 - 48) + 'px');
            try {
                var data = JSON.parse(cell.text);
                var content = data.CN;
                if (content !== null) {
                    content = content.replace('\n', '<br/>');
                }
                text.get(0).innerHTML = content;
            } catch (e) {
                text.get(0).innerHTML = '';
                console.log(e);
            }
            div.get(0).append(text.get(0));
            break;
    }
    div.on('mousedown', function (event) {
        moveCell = cell;

    });
    return div.get(0);
}

//cell对像
function Cell(cell) {
    this.cell = cell;
    this.cellDiv = cellDiv(cell);
}

/**
 * @param cell
 * @returns {*|jQuery|HTMLElement}
 */
function cellMenuDiv(cell) {
    var div = $('<div></div>');
    div.css('text-align', 'center');
    div.css('width', '300px');
    div.css('height', 'center');
    div.css('line-height', '240px');
    div.css('border', 'solid');
    div.css('border-width', '1px');
    div.css('border-color', '#360036');
    switch (cell.type) {
        case 11:
            break;
        default:
            var image = $('<img>');
            image.css('vertical-align', 'middle');
            image.attr('ondragstart', 'return false;');
            image.attr('src', cell.imageurl1);
            if (cell.width / cell.height > 300 / 240) {
                image.attr('width', '300px');
                image.attr('height', 'auto');
            } else {
                image.attr('width', 'auto');
                image.attr('height', '240px');
            }
            div.get(0).append(image.get(0));
            break;
    }
    div.on('mousedown', function (event) {
        //添加点击事件
        addCell = cell;
    });
    return div.get(0);
}

//cellMenu对像
function CellMenu(cell) {
    this.cell = cell;
    this.cellMenuDiv = cellMenuDiv(cell);
}

/**
 * 根据TabID获取一页的cell数据
 * @param tabId
 */
function getScreenCell(tabId) {
    var flyscreen = $('.flyscreen').get(0);
    $.ajax({
        url: testurl,
        type: "get",
        data: "tabId=" + tabId,
        dataType: 'html',
        success: function (result) {
            try {
                var data = JSON.parse(result);
                screenCellArr.splice(0, screenCellArr.length);
                flyscreen.innerHTML = '';
                for (i = 0; i < data.cellList.length; i++) {
                    screenCellArr[i] = new Cell(data.cellList[i]);
                    flyscreen.append(screenCellArr[i].cellDiv);
                }
            } catch (e) {
                console.log(e);
            }
        }
    });
}

/**
 * 获取添加的所有cell样板数据
 */
function getCellMenu() {
    var flycellmenu = $('.flycellmenu').get(0);
    $.ajax({
        url: cellurl,
        type: "get",
        data: "",
        dataType: 'html',
        success: function (result) {
            try {
                var data = JSON.parse(result);
                menuCellArr.splice(0, menuCellArr.length);
                flycellmenu.innerHTML = '';
                for (i = 0; i < data.rows.length; i++) {
                    var num = screenCellArr.length;
                    menuCellArr[num] = new CellMenu(data.rows[i]);
                    flycellmenu.append(menuCellArr[num].cellMenuDiv);
                }
            } catch (e) {
                console.log(e);
            }
        }
    });
}

+$(function () {
    getCellMenu();
    $(document.body).on('mousedown', function (event) {
        //
    }).on('mousemove', function (event) {
        try {
            if (addCell !== null) {
                addCell.imgUrl = addCell.imageurl1;
                if (moveDiv === null) {
                    moveDiv = cellDiv(addCell);
                    this.append(moveDiv);
                }
                moveDiv.style.left = event.clientX + 'px';
                moveDiv.style.top = event.clientY + 'px';
            }
        } catch (e) {
            alert(e);
        }
    }).on('mouseup', function (event) {
        if (moveDiv !== null) {
            this.removeChild(moveDiv);
            moveDiv = null;
        }

        var flyscreen = $('.flyscreen').get(0);

        var left = flyscreen.offsetLeft;
        var top = flyscreen.offsetTop;
        var width = flyscreen.offsetWidth;
        var height = flyscreen.offsetHeight;

        if (event.clientX >= left && event.clientX <= (width+left) && event.clientY >= top && event.clientY <= (height+top)) {
            if (addCell !== null) {
                var x = event.clientX - left + flyscreen.scrollLeft;
                var y = event.clientY - top + flyscreen.scrollTop;
                addCell.x = x * 1920 / 1280;
                addCell.y = y * 1920 / 1280;
                addCell.imgUrl = addCell.imageurl1;
                var num = screenCellArr.length;
                screenCellArr[num] = new Cell(addCell);
                flyscreen.append(screenCellArr[num].cellDiv);
            }
        }

        if (addCell !== null) {
            addCell = null;
        }
    });

    $('.flyscreen').on('mousemove', function (event) {
        var left = this.offsetLeft;
        var top = this.offsetTop;
        var x = event.clientX - left + this.scrollLeft;
        var y = event.clientY - top + this.scrollTop;
        $('.flyscreenmsg').get(0).innerHTML = x + '-' + y;
    }).on('mouseup', function (event) {
    });
});