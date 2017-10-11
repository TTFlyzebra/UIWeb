function F_Open_dialog() {
    document.getElementById("flyinput").click();
}


$.fn.flyinput = function (option) {
    /**
     * 修改样式
     */
    if (option.showimage === true) {
        this.css("display", "none");
        this.after('<img  id="simg" width=' + option.imagew + ' height=' + option.imageh + ' onclick="F_Open_dialog()" src="/MyWeb/UI/public/uploads/2d/aabc960f1fca0996937cc634c0e0d4.png">');
    }
    /**
     * 自动上传
     */
    if (option.autoup === true) {
        this.on("change", function () {
            var formData = new FormData();
            formData.append(this.name, this.files[0]);
            $.ajax({
                url: option.url,
                type: "POST",
                data: formData,
                /**
                 *必须false才会自动加上正确的Content-Type
                 */
                contentType: false,
                /**
                 * 必须false才会避开jQuery对 formdata 的默认处理
                 * XMLHttpRequest会对 formdata 进行正确的处理
                 */
                processData: false,
                success: function (data) {
                    var result = JSON.parse(data);
                    alert(result.saveName);
                    $('#simg').attr('src',result.saveName);
                },
                error: function () {
                    alert("上传失败！");
                }
            });
        });
    }
}