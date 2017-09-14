function loadJSON() {
    $.ajax({
        url: "http://192.168.1.43:9020/api/ui-operation/api/v/launcher_cell.json?tabId=162",
        dataType: 'json',
        success: function (result) {
            alert("result!")
            document.getElementById("content").innerHTML = result;
        }
    });
}

var i = 0;

function showJSON() {
    document.getElementById("content" + i).innerHTML = "<div id=" + "'newItem" + (i+1) + "'" + " class=\"left_menu_item\"><a href=\"javascript:showJSON();\">加载JSON</a></div>\n" +
        "    <div id=\"content" + (i+1) + "\"" + ">JSON内容</div>";
    document.getElementById("newItem" + (i+1)).addEventListener('click', function () {
        i++;
        showJSON();
    }, false);
}
