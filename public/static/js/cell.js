//POST提交数据
function postform() {
    if ($('#celltypename').val() === "") {
        $('#celltypename').focus();
        return
    }
    $.ajax({
        type: "post",
        url: celltypeurl,
        data: $('#celltypeform').serialize(),
        error: function (request) {
            alert("向服务器提交数据失败了!\n" +
                "可能的错误原因：\n" +
                "1.重复的类型名称;\n" +
                "2.网络错误。");
        },
        success: function (data) {
            $('#myModal').modal("hide");
            //更新显示列表
            $('#celltypetable').bootstrapTable('refresh');
            //重置表单
            $('#celltypeform')[0].reset();
        }
    });
}


//bootstrap-input脚本
$("#imgurl1").fileinput({
    language: 'zh',
    uploadUrl: upimageurl,
    allowedFileExtensions: ['jpg', 'png', 'gif'],
    overwriteInitial: true,
    uploadAsync: true,          //默认异步上传
    showUpload: false,          //是否显示上传按钮
    showRemove: false,          //显示移除按钮
    showPreview: true,          //是否显示预览
    showClose:false,            //是否显示关闭按钮
    showCaption: false,         //是否显示标题
    dropZoneEnabled: true,      //是否显示拖拽区域
    maxImageWidth: 1280,        //图片的最大宽度
    maxImageHeight: 720,        //图片的最大高度
    resizeImage: false,
    resizePreference: 'width',
    minFileCount: 1,
    maxFileCount: 1,
    autoReplace:true,
    maxFileSize: 10*1024,
    enctype: 'multipart/form-data',
    validateInitialCount: true,
    showBrowse: false,
    browseOnZoneClick: true,
    removeFromPreviewOnError:false,
    errorCloseButton:"",
})
    //选择文件后处理事件
    .on("filebatchselected", function (event, files) {
        $(this).fileinput("upload");
    })
    //异步上传返回结果处理
    .on("fileuploaded", function (event, data, previewId, index) {
        $('#imgurl').val(data.response.savaName);
    })
    .on('fileloaded', function (event, file, previewId, index, reader) {
        // alert("fileloaded");
    })
    .on('fileuploaderror',function (event,data,msg) {
        // $(this).fileinput('clear').fileinput("destory").fileinput("cancle");
    })
    .on("filebatchuploadsuccess", function (event, data, previewId, index) {
        // alert("filebatchuploadsuccess");
    });

$("#imgurl2").fileinput({
    language: 'zh',
    uploadUrl: upimageurl,
    allowedFileExtensions: ['jpg', 'png', 'gif'],
    overwriteInitial: true,
    uploadAsync: true,          //默认异步上传
    showUpload: false,          //是否显示上传按钮
    showRemove: false,          //显示移除按钮
    showPreview: true,          //是否显示预览
    showClose:false,            //是否显示关闭按钮
    showCaption: false,         //是否显示标题
    dropZoneEnabled: true,      //是否显示拖拽区域
    maxImageWidth: 1280,        //图片的最大宽度
    maxImageHeight: 720,        //图片的最大高度
    resizeImage: false,
    resizePreference: 'width',
    minFileCount: 1,
    maxFileCount: 1,
    autoReplace:true,
    maxFileSize: 10*1024,
    enctype: 'multipart/form-data',
    validateInitialCount: true,
    showBrowse: false,
    browseOnZoneClick: true,
    removeFromPreviewOnError:false,
    errorCloseButton:"",
})
//选择文件后处理事件
    .on("filebatchselected", function (event, files) {
        $(this).fileinput("upload");
    })
    //异步上传返回结果处理
    .on("fileuploaded", function (event, data, previewId, index) {
        $('#imgurl').val(data.response.savaName);
    })
    .on('fileloaded', function (event, file, previewId, index, reader) {
        // alert("fileloaded");
    })
    .on('fileuploaderror',function (event,data,msg) {
        // $(this).fileinput('clear').fileinput("destory").fileinput("cancle");
    })
    .on("filebatchuploadsuccess", function (event, data, previewId, index) {
        // alert("filebatchuploadsuccess");
    });
