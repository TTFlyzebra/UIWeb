$.fn.flyinput = function (option) {
    var divimg;
    var self = this;
    /**
     * 修改样式
     */
    if (option.showPreview === true) {
        this.css("display", "none");
        var divparent = $('<div onclick="" style="text-align:center;overflow:hidden;width:' +
            option.width + ';height:' + option.height +
            ';line-height:' + option.height +
            ';background:' + option.background +
            '"></div>');
        divparent.on('click',function () {
            self.click();
        });
        divimg = $('<img style="vertical-align:middle" src="">');
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
                success: function (data) {
                    self.trigger("success",data);
                    try {
                        var result = JSON.parse(data);
                        if (result.ret === 0) {
                            divimg.attr('src', result.data.saveName);
                            var a = result.data.width / result.data.height;
                            var b = divparent.width() / divparent.height();
                            if (a > b) {
                                divimg.css("width", option.width);
                                divimg.css("height", "auto");
                            } else {
                                divimg.css("width", "auto");
                                divimg.css("height", option.height);
                            }
                        } else {
                            divimg.attr('src', "");
                            alert(result.msg+result.data);
                        }
                    } catch (e) {
                        divimg.attr('src', "");
                        alert("catch error:"+e);
                    }
                },
                error: function () {
                    alert("上传图片失败！");
                    divimg.attr('src', "");
                }
            });
        });
    }

    this.image = function () {
        return divimg;
    };
    return this;
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