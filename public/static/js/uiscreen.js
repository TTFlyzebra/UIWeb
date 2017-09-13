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

function showJSON() {
    document.getElementById("content").innerHTML = "result";
}