window.onload = function () {
    // 将所有点击的标题和要显示隐藏的列表取出来
    var ps = document.getElementsByTagName("p");
    var uls = document.getElementsByTagName("ul");

    // 遍历所有要点击的标题且给它们添加索引及绑定事件
    for (var i = 0, n = ps.length; i < n; i += 1) {

        ps[i].id = i;
        ps[i].onclick = function () {
//                    for (var j = 0; j < n; j += 1) {
//                        uls[j].style.display = "none";
//                    }
            if (uls[this.id].style.display === "block") {
                uls[this.id].style.display = "none";
            } else {
                uls[this.id].style.display = "block";
            }
        }
        // 获取点击的标题上的索引属性，根据该索引找到对应的列表
    }
    // 判断该列表，如果是显示的则将其隐藏，如果是隐藏的则将其显示出来
}