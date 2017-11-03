//定义全局变量
var screenCellArr = [];
var menuCellArr = [];
var screenMoveDiv = null;
var screenMoveDivPoint = {};
var screenMoveCell = null;
var bodyMoveDiv = null;
var addMenuCell = null;

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


function showMSG(message) {
    var flyscreenmsg = $('.flyscreenmsg').get(0);
    if (flyscreenmsg) {
        flyscreenmsg.innerHTML = message;
    }
}


/**
 * @param cell
 * @returns {*|jQuery|HTMLElement}
 */
function cellScreenDiv(cell,num) {
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
            image.attr('src', cell.imageurl1);
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
                if (content) {
                    content = content.replace('\n', '<br/>');
                }
                text.get(0).innerHTML = content;
            } catch (e) {
                text.get(0).innerHTML = '';
                console.log(e);
            }
            div.get(0).append(text.get(0));
            //删除按钮
            var del =  $('<div>X</div>');
            del.css('position', 'absolute');
            del.css('left', (cell.width * 1280 / 1920-22)+'px');
            del.css('top', '2px');
            del.css('width', '20px');
            del.css('height', '20px');
            del.css('background','#FFFFFF');

            del.on("click",function (event) {
                $('.flyscreen').get(0).removeChild(div.get(0));
                screenCellArr.splice(num,1);
            });
            div.get(0).append(del.get(0));
            break;
    }
    div.on('mousedown', function (event) {
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
            screenMoveDiv = div.get(0);
            screenMoveDivPoint.x = x2;
            screenMoveDivPoint.y = y2;
        }
    });
    return div.get(0);
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
    div.css('border-color', '#000000');
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
        addMenuCell = cell;
    });
    return div.get(0);
}

/**
 * 根据TabID获取一页的cell数据
 * @param tabId
 */
function getScreenCell(tabId) {
    var flyscreen = $('.flyscreen').get(0);
    if (flyscreen) {
        $.ajax({
            url: tablecellurl,
            type: "get",
            data: "tableId=" + tabId,
            dataType: 'html',
            success: function (result) {
                try {
                    var data = JSON.parse(result);
                    screenCellArr.splice(0, screenCellArr.length);
                    flyscreen.innerHTML = '';
                    for (i = 0; i < data.cellList.length; i++) {
                        var num = screenCellArr.length;
                        var div = cellScreenDiv(data.cellList[i],num);
                        if (div) {
                            screenCellArr[num] = data.cellList[i];
                            flyscreen.append(div);
                        }
                    }
                } catch (e) {
                    console.log(e);
                }
            }
        });
    }
}

/**
 * 获取添加的所有cell样板数据
 */
function getCellMenu() {
    var flycellmenu = $('.flycellmenu').get(0);
    if (flycellmenu) {
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
                        menuCellArr[num] = data.rows[i];
                        flycellmenu.append(cellMenuDiv(menuCellArr[num]));
                    }
                } catch (e) {
                    console.log(e);
                }
            }
        });
    }
}

function documentEventInit() {
    $(document).on('mousedown', function (event) {
        //
    }).on('mousemove', function (event) {
        try {
            if (addMenuCell) {
                addMenuCell.imgUrl = addMenuCell.imageurl1;
                if (bodyMoveDiv === null) {
                    bodyMoveDiv = cellScreenDiv(addMenuCell);
                    document.body.appendChild(bodyMoveDiv);
                }
                bodyMoveDiv.style.left = event.clientX + 'px';
                bodyMoveDiv.style.top = event.clientY + 'px';
            }
        } catch (e) {
            console.log(e);
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
        if (bodyMoveDiv) {
            document.body.removeChild(bodyMoveDiv);
            bodyMoveDiv = null;
        }

        var flyscreen = $('.flyscreen').get(0);

        if (flyscreen) {
            var left = flyscreen.offsetLeft;
            var top = flyscreen.offsetTop;
            var width = flyscreen.offsetWidth;
            var height = flyscreen.offsetHeight;

            if (event.clientX >= left && event.clientX <= (width + left) && event.clientY >= top && event.clientY <= (height + top)) {
                if (addMenuCell) {
                    var x = event.clientX - left + flyscreen.scrollLeft;
                    var y = event.clientY - top + flyscreen.scrollTop;
                    addMenuCell.x = x * 1920 / 1280;
                    addMenuCell.y = y * 1920 / 1280;
                    addMenuCell.imgUrl = addMenuCell.imageurl1;
                    var num = screenCellArr.length;
                    screenCellArr[num] = addMenuCell;
                    flyscreen.append(cellScreenDiv(screenCellArr[num]));
                }
            }
        }
        if (addMenuCell) {
            addMenuCell = null;
        }
    });

}

function flyscreenClassEventInit() {
    var flyscreen = $('.flyscreen');
    if (flyscreen) {
        flyscreen.on('mousemove', function (event) {
            var x = event.clientX;
            var y = event.clientY;
            if (screenMoveCell) {
                x = x - screenMoveDivPoint.x;
                y = y - screenMoveDivPoint.y;
                screenMoveCell.x = x * 1920 / 1280;
                screenMoveCell.y = y * 1920 / 1280;
                screenMoveDiv.style.left = x + 'px';
                screenMoveDiv.style.top = y + 'px';
            }
            showMSG(x + "--" + y);
        }).on('mouseup', function (event) {
            if (screenMoveDiv) {
                screenMoveDiv = null;
            }
            if (screenMoveCell) {
                screenMoveCell = null;
            }
        });
    }
}

function upTableData() {
    var tableCellArr = [];
    for (var i = 0; i < screenCellArr.length; i++) {
        tableCellArr[i] = {};
        tableCellArr[i].cellId = screenCellArr[i].cellId;
        tableCellArr[i].width = screenCellArr[i].width;
        tableCellArr[i].height = screenCellArr[i].height;
        tableCellArr[i].x = screenCellArr[i].x;
        tableCellArr[i].y = screenCellArr[i].y;
    }

    var celljson = JSON.stringify(tableCellArr);

    $.ajax({
        url: tablecellurl,
        type: "post",
        data: "jsondata="+celljson+"&tableId="+tableId,
        dataType: 'html',
        error: function (request) {
            alert("向服务器更新页面数据失败了!");
        },
        success: function (result) {
        }
    });
}


+$(function () {
    getCellMenu();
    documentEventInit();
    flyscreenClassEventInit();

});