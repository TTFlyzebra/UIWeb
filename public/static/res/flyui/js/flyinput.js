$.fn.flyinput = function (option) {
    var divimg;
    var self = this;
    /**
     * 修改样式
     */
    if (option.showPreview === true) {
        this.css("display", "none");
        var divparent = $('<div onclick="" style="display: flex;align-items:center;justify-content:center;overflow:hidden;width:' +
            option.width + ';height:' + option.height + ';background:#0f0f0f"></div>');
        divparent.on('click', function () {
            self.click();
        });
        divimg = $('<img style="max-width: ' + option.width + ';max-height:' + option.height + ';width: auto;height: auto"  alt="">');
        divimg.attr('src', option.image);
        divparent.append(divimg);
        this.after(divparent);
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
                success: function (result) {
                    self.trigger("success", result);
                    try {
                        var obj = JSON.parse(result);
                        if (obj.code === 0) {
                            divimg.attr('src', obj.data.saveName);
                            // var a = obj.data.width / obj.data.height;
                            // var b = divparent.width() / divparent.height();
                            // if (a > b) {
                            //     divimg.css("width", option.width);
                            //     divimg.css("height", "auto");
                            // } else {
                            //     divimg.css("width", "auto");
                            //     divimg.css("height", option.height);
                            // }
                        } else {
                            divimg.attr('src', option.image);
                            alert(obj.msg + "data" + obj.data);
                        }
                    } catch (e) {
                        divimg.attr('src', option.image);
                        alert("catch error:" + e);
                    }
                },
                error: function (result) {
                    alert("上传图片失败！");
                    divimg.attr('src', option.image);
                }
            });
        });
    }

    this.image = function () {
        return divimg;
    };
    return this;
}