//记录选定的要改变位置的ll对象
var selectCell = null;
//记录拖动中的要添加的对象
var moveCell = null;
//布局屏幕
var screen = document.getElementsByClassName("flyscreen")[0];
//定义Item列表
var basecells = document.getElementsByClassName("flybasecells")[0];
//消息显示框
var screenmsg = document.getElementsByClassName("flyscreenmsg")[0];
//枚举所有布局屏幕中的子对象并添加相应处理事件
if (screen !== null&&screen!==undefined) {
    var fcells = screen.getElementsByClassName("flyscreencell");
}

//枚举所有添加的类型对象并添加相应处理事件
if (basecells !== null&&basecells!==undefined) {
    var bcells = basecells.getElementsByClassName("flybasecell");
}

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
 * 将变量尾部加上px并以字符串形式返回
 * @param _px 要转换的字符串
 * @returns 尾部加上px的字符串
 */
function pastePX(_px) {
    return _px + "px";
}

if (screen !== null&&screen!==undefined) {
    screen.addEventListener("mousemove", function (event) {
        if (selectCell !== null) {
            var x = event.clientX - selectCell.offsetWidth / 2;
            var y = event.clientY - selectCell.offsetHeight / 2;
            selectCell.style.left = pastePX(x);
            selectCell.style.top = pastePX(y);
            if (screenmsg !== null) {
                screenmsg.innerHTML = x + " " + y;
            }
        }
    }, false);
}

if (fcells !== null&&fcells!==undefined) {
    for (i = 0; i < fcells.length; i++) {
        fcells[i].addEventListener("mousedown", function (event) {
            selectCell = this;
        }, false);
    }
}

if (bcells !== null&&bcells!==undefined) {
    for (i = 0; i < bcells.length; i++) {
        bcells[i].addEventListener("mousedown", function (event) {
            moveCell = this.cloneNode(true);
        }, false);
    }
}

document.body.addEventListener("mouseup", function (event) {
    selectCell = null;
    screenmsg.innerHTML = "";
    if (moveCell !== null) {
        document.body.removeChild(moveCell);
        screen.appendChild(moveCell);
        moveCell.addEventListener("mousedown", function (event) {
            selectCell = this;
        }, false);
        moveCell = null;
    }
}, false);

document.body.addEventListener("mouseleave", function (event) {
    selectCell = null;
    if (moveCell !== null) {
        document.body.removeChild(moveCell);
        moveCell = null;
    }
    screenmsg.innerHTML = "";
}, false);

document.body.addEventListener("mousemove", function (event) {
    if (moveCell !== null) {
        document.body.appendChild(moveCell);
        var x = event.clientX - moveCell.offsetWidth / 2;
        var y = event.clientY - moveCell.offsetHeight / 2;
        moveCell.style.left = pastePX(x);
        moveCell.style.top = pastePX(y);
        if (screenmsg !== null) {
            screenmsg.innerHTML = x + " " + y;
        }
    }
}, false);

/**
 * 禁用浏览器默认的开始拖动效果
 * @returns {boolean}
 */
function ondragstart() {
    return false;
}

function createCellDiv(cell) {
    var div = document.createElement("img");
    div.style.position= "absolute";
    div.style.left = pastePX(cell.x*1280/1920);
    div.style.top = pastePX(cell.y*1280/1920);
    div.style.width = pastePX(cell.width*1280/1920);
    div.style.height = pastePX(cell.height*1280/1920);
    div.src = cell.imgUrl;
    div.ondragstart = ondragstart;
    div.addEventListener("mousedown", function (event) {
        selectCell = this;
    }, false);
    return div;
}

$.ajax({
    url: "/MyWeb/UI/index.php/api/test",
    type: "get",
    data: "",
    dataType: 'html',
    success: function (result) {
        var data = JSON.parse(result);
        for(i=0;i<data.cellList.length;i++){
            screen.appendChild(createCellDiv(data.cellList[i]));
        }
    }
});
