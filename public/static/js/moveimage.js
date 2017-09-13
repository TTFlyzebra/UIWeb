function addDiv() {
    var div = document.createElement('div');
    div.innerHTML = '<img id="_imageObj" width="200px" height="150px" src="./img/img.png"/>';
    div.style.width = "200px";
    div.style.height = "150px";
    div.style.float = "left";
    var bo = outerDiv();
    bo.insertBefore(div, bo.firstChild);
}

function getElem(id) {
    return document.getElementById(id);
}

function trimPX(_px) {
    if (_px === null || _px === "") {
        return 0;
    }
    return parseInt(_px.substr(0, _px.lastIndexOf("px")));
}

function hitInRect(hitX, hitY, rcLeft, rcTop, rcWidth, rcHeight) {
    return (hitX >= rcLeft && hitX < rcLeft + rcWidth && hitY >= rcTop && hitY < rcTop
        + rcHeight);
}

function outerDiv() {
    return getElem("_outerDiv");
}

function imageDiv() {
    return getElem("_imageDiv");
}

var dragging = false;
var startTop = 0;
var startLeft = 0;
var dragPosY = 0;
var dragPosX = 0;

window.addEventListener("load", initPage, false);

function initPage() {
    outerDiv().addEventListener(
        "mousedown", // start moving image
        function (event) {
            startLeft = trimPX(imageDiv().style.left);
            startTop = trimPX(imageDiv().style.top);
            var width = trimPX(imageDiv().style.width);
            var height = trimPX(imageDiv().style.height);

            var x = event.clientX-200;
            var y = event.clientY-50;

            if (hitInRect(x, y, startLeft,startTop, width, height)) {
                dragging = true;
                dragPosX = event.clientX;
                dragPosY = event.clientY;
                event.preventDefault(); // disable default behavior of browser
            }

        }, false);

    outerDiv().addEventListener("mousemove", // moving image
        function (event) {
            if (dragging) {
                imageDiv().style.cursor = "pointer";
                //imageDiv().style.top = parseInt(startTop)+(event.clientY - dragPosY) + "px";
                imageDiv().style.top = "0px";
                var dx = parseInt(startLeft) + (event.clientX - dragPosX);
                if (dx < 0) {
                    dx = 0;
                } else if (dx > 1080) { //可拖动框宽度减去图片宽度
                    dx = 1080;
                }
                imageDiv().style.left = dx + "px";

                var dy = parseInt(startTop) + (event.clientY - dragPosY);
                if (dy < 0) {
                    dy = 0;
                } else if (dy > 570) { //可拖动框宽度减去图片宽度
                    dy = 570;
                }
                imageDiv().style.top = dy + "px";

                //imageDiv().style.left = parseInt(startLeft)+(event.clientX - dragPosX) + "px";
                //alert(imageDiv().style.left);
            }
            event.preventDefault();
        }, false);

    outerDiv().addEventListener("mouseup", // stop moving image
        function (event) {
            dragging = false;
            imageDiv().style.cursor = "default";
            event.preventDefault();
        }, false);
}