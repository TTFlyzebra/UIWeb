/**
 * 将以"px"字符串结尾的字符串转换成int整数
 * @param _px 以"px"结尾的字符串
 * @returns 去掉"px"后转换的int整数
 */
function trimPX(_px) {
    if (_px == null || _px == "")
        return 0;
    return parseInt(_px.substr(0, _px.lastIndexOf("px")));
}


//选定的Cell对象
var selectCell = null;
//屏幕对象
var screen = (document.getElementsByClassName("flyscreen"))[0];

var cells = screen.getElementsByClassName("flycell");
for (i = 0; i < cells.length; i++) {
    cells[i].addEventListener("mousedown", function (event) {
        selectCell = cells[i];
        alert("cell click!");
    }, false);
}

screen.addEventListener("mouseup", function (event) {
    selectCell = null;
}, false);

screen.addEventListener("mousemove", function (event) {
    if(selectCell!=null){
        alert("select cell");
    }
}, false);