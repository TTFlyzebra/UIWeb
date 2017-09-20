//记录选定的要改变位置的ll对象
var selectCell = null;
//记录拖动中的要添加的对象
var moveCell = null;
//布局屏幕
var screen = document.getElementsByClassName("flyscreen")[0];
//
var basecells = document.getElementsByClassName("flybasecells")[0];
//消息显示框
var screenmsg = document.getElementsByClassName("flyscreenmsg")[0];
//枚举所有布局屏幕中的子对象并添加相应处理事件
var fcells = screen.getElementsByClassName("flyscreencell");
//枚举所有添加的类型对象并添加相应处理事件
var bcells = basecells.getElementsByClassName("flybasecell");

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

for (i = 0; i < fcells.length; i++) {
    fcells[i].addEventListener("mousedown", function (event) {
        selectCell = this;
    }, false);
}

for (i = 0; i < bcells.length; i++) {
    bcells[i].addEventListener("mousedown", function (event) {
        moveCell = this.cloneNode(true);
    }, false);
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

document.body.addEventListener("dblclick", function (event) {
    var cell = document.body.getElementsByClassName("flybasecell")[0];
    var img = cell.getElementsByTagName("img")[0];
    alert(window.location.host+img.attributes["src"].nodeValue);
}, false);