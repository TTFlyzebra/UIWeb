var screenArr = [];
var cellMenuArr = [];
var moveCell;

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
                text.get(0).innerHTML = e;
            }
            div.get(0).append(text.get(0));
            break;
    }
    div.on('click', function (event) {
        alert('x=' + event.clientX);
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
    div.on('click', function (event) {
        //添加点击事件
    });
    return div.get(0);
}

//cellMenu对像
function CellMenu(cell) {
    this.cell = cell;
    this.cellMenuDiv = cellMenuDiv(cell);
}


function getScreenCell(tabId) {
    $.ajax({
        url: testurl,
        type: "get",
        data: "tabId=" + tabId,
        dataType: 'html',
        success: function (result) {
            try {
                var data = JSON.parse(result);
                screenArr.splice(0, screenArr.length);
                $('#flyscreen').get(0).innerHTML = "";
                for (i = 0; i < data.cellList.length; i++) {
                    screenArr[i] = new Cell(data.cellList[i]);
                    $('#flyscreen').get(0).append(screenArr[i].cellDiv);
                }
            } catch (e) {
                console.log(e);
            }
        }
    });
}

function getCellMenu() {
    $.ajax({
        url: cellurl,
        type: "get",
        data: "",
        dataType: 'html',
        success: function (result) {
            try {
                var data = JSON.parse(result);
                cellMenuArr.splice(0, cellMenuArr.length);
                $('#flycellmenu').get(0).innerHTML = "";
                for (i = 0; i < data.rows.length; i++) {
                    cellMenuArr[i] = new CellMenu(data.rows[i]);
                    $('#flycellmenu').get(0).append(cellMenuArr[i].cellMenuDiv);
                }
            } catch (e) {
                alert(e);
                console.log(e);
            }
        }
    });
}

+$(function () {
    getCellMenu();
});