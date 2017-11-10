//POST提交数据
function postform() {
    $.ajax({
        type: "post",
        url: cellurl,
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

            //置空上传图片
            $('#myModal').find("img").each(function (i) {
                $(this).attr('src', "");
            });

            $('#imageurl1').val("");
            $('#imageurl2').val("");
        }
    });
}


function delCell(cellId) {
    $.ajax({
        type: "delete",
        url: cellurl,
        contentType: "application/json",
        data: {
            cellId:cellId
        },
        error: function (request) {
            alert("向服务器提交数据失败了!\n" +
                "可能的错误原因：\n" +
                "1.网络错误。");
        },
        success: function (data) {
            //更新显示列表
            $('#celltypetable').bootstrapTable('refresh');
        }
    });
}

var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#celltypetable').bootstrapTable({
            url: cellurl,     //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            dataType: 'json',
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                    //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: function (params) {
                return {
                    offset: params.offset,
                    limit: params.limit,
                };
            },                                  //传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,                      //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [5, 10, 20, 50, 100, 200],   //可供选择的每页的行数（*）
            search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: false,
            showColumns: true,                  //是否显示所有的列
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
//                height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "cellId",             //每一行的唯一标识，一般为主键列
            showToggle: false,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                  //是否显示父子表
            columns: [{
                checkbox: true
            }, {
                field: 'cellId',
                title: 'ID'
            }, {
                field: 'celltypeId',
                title: '类型'
            }, {
                field: 'name',
                title: '名称'
            }, {
                field: 'width',
                title: '宽度'
            }, {
                field: 'height',
                title: '高度'
            }, {
                field: 'imageurl1',
                title: '图片一',
                align: 'center',
                formatter: function (value, row, index) {
                    return '<img  width="auto" height="50px" src="' + value + '">';
                }
            }, {
                field: 'imageurl2',
                title: '图片二',
                align: 'center',
                formatter: function (value, row, index) {
                    return '<img  width="auto" height="50px" src="' + value + '">';
                }
            }]
        });
    };
    //得到查询的参数
    return oTableInit;
};

function initFileUpdata() {
    $('#imageinput1').flyinput({
        url: upimageurl,
        autoup: true,
        showPreview: true,
        width: "360px",
        height: "240px",
        background: "#EFEFEF"
    }).bind("success", function (e, data) {
        var result = JSON.parse(data);
        $('#imageurl1').val(result.saveName);
        $('#width').val(result.width);
        $('#height').val(result.height);
    });

    $('#imageinput2').flyinput({
        url: upimageurl,
        autoup: true,
        showPreview: true,
        width: "360px",
        height: "240px",
        background: "#EFEFEF"
    }).bind("success", function (e, data) {
        var result = JSON.parse(data);
        $('#imageurl2').val(result.saveName);
    });
}


+$(function () {
    var oTable = new TableInit();
    oTable.Init();
    initFileUpdata();
    $('#btn_delete').on("click", function (event) {
        var a = $('#celltypetable').bootstrapTable('getSelections');
        for(var i=0;i<a.length;i++){
            delCell(a[i].cellId);
        }
    });
});
