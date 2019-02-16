//POST提交数据
function postcelltype() {
    if ($('#celltypename').val() === "") {
        $('#celltypename').focus();
        return
    }

    if ($('#celltype').val() === "") {
        $('#celltype').focus();
        return
    }
    $.ajax({
        type: "post",
        url: celltypeurl,
        data: $('#celltypeform').serialize(),
        error: function (request) {
            alert("向服务器提交数据失败了!\n" +
                "可能的错误原因：\n" +
                "1.重复的类型标识;\n" +
                "2.重复的类型名称;\n" +
                "3.网络请求失败。");
        },
        success: function (data) {
            $('#myModal1').modal("hide");
            //更新显示列表
            $('#celltypetable').bootstrapTable('refresh');
            //重置表单
            $('#celltypeform')[0].reset();
            //置空上传图片
            $('#myModal1').find("img").each(function (i) {
                $(this).attr('src', "");
            });
            $('#imgurl').val("");
        }
    });
}

//POST提交数据
function putcelltype() {
    if ($('#celltypename').val() === "") {
        $('#celltypename').focus();
        return
    }

    if ($('#celltype').val() === "") {
        $('#celltype').focus();
        return
    }
    $.ajax({
        type: "put",
        url: celltypeurl,
        data: $('#celltypeform').serialize(),
        error: function (request) {
            alert("向服务器提交数据失败了!\n" +
                "可能的错误原因：\n" +
                "1.重复的类型标识;\n" +
                "2.重复的类型名称;\n" +
                "3.网络请求失败。");
        },
        success: function (data) {
            $('#myModal2').modal("hide");
            //更新显示列表
            $('#celltypetable').bootstrapTable('refresh');
            //重置表单
            $('#celltypeform2')[0].reset();
            //置空上传图片
            $('#myModal2').find("img").each(function (i) {
                $(this).attr('src', "");
            });
            $('#imgurl2').val("");

        }
    });
}


function delCelltype(celltypeId) {
    $.ajax({
        type: "delete",
        url: celltypeurl,
        contentType: "application/json",
        data: {
            celltypeId:celltypeId
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

//bootstrap-table脚本
$(function () {
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    //2.初始化Button的点击事件
    // var oButtonInit = new ButtonInit();
    // oButtonInit.Init();

});

var TableInit = function () {
    var oTableInit = {};
    //初始化Table
    oTableInit.Init = function () {
        $('#celltypetable').bootstrapTable({
            url: celltypeurl,     //请求后台的URL（*）
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
            uniqueId: "celltypeId",             //每一行的唯一标识，一般为主键列
            showToggle: false,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                  //是否显示父子表
            columns: [{
                checkbox: true
            }, {
                field: 'celltype',
                title: '类型标识'
            },{
                field: 'celltypename',
                title: '类型名称'
            }, {
                field: 'imageurl',
                title: '设计原图',
                align: 'center',
                formatter: function (value, row, index) {
                    return '<img  width="auto" height="50px" src="' + value + '">';
                }
            }, {
                field: 'extend1name',
                title: '新增字段1'
            }, {
                field: 'extend2name',
                title: '新增字段2'
            }, {
                field: 'extend3name',
                title: '新增字段3'
            }, {
                field: 'extend4name',
                title: '新增字段4'
            }, {
                field: 'edittime',
                title: '修改时间'
            }]
        });
    };
    //得到查询的参数
    return oTableInit;
};

$('#imageinput1').flyinput({
    url: upimageurl,
    autoup: true,
    showPreview: true,
    width: "100%",
    height: "240px",
    background: "#EFEFEF"
}).on("success", function (event, data) {
    var result = JSON.parse(data);
    $('#imageurl1').val(result.data.saveName);
});

$('#imageinput2').flyinput({
    url: upimageurl,
    autoup: true,
    showPreview: true,
    width: "100%",
    height: "240px",
    background: "#EFEFEF"
}).on("success", function (event, data) {
    var result = JSON.parse(data);
    $('#imageurl2').val(result.data.saveName);
});

$('#btn_add').on("click", function (event) {
});


$('#btn_edit').on("click",function (event) {
    var a = $('#celltypetable').bootstrapTable('getSelections');
    if(a.length>0){
        alert(a[0].celltypeId
            +","+a[0].celltype
            +","+a[0].celltypename
            +","+a[0].imageurl
            +","+a[0].extend1name
            +","+a[0].extend2name
            +","+a[0].extend3name
            +","+a[0].extend4name);
    }
});

$('#btn_delete').on("click", function (event) {
    var a = $('#celltypetable').bootstrapTable('getSelections');
    for(var i=0;i<a.length;i++){
        delCelltype(a[i].celltypeId);
    }
});