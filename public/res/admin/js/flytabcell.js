+$(function () {
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
});

var subnum = 0;

function addSubTab() {
    var mainmenu =  $('#mainmenu');
    var submenu = mainmenu.clone(true);
    submenu.get(0).innerHTML="";
    subnum++;
    var subcontent = $('<a href="#tabcontent'+subnum+'" data-toggle="tab">子控件'+subnum+'</a>');
    subcontent.get(0).setAttribute('value',subnum);
    subcontent.on("click",function () {
        var subid = this.getAttribute('value');
        for(var i=0;i<=subnum;i++){
            if(subid===i){
                $('#tabcontent0').addClass('acvite');
            }else{
                $('#tabcontent1').removeClass('acvite');
            }
        }

    });
    submenu.get(0).appendChild(subcontent.get(0));
    $('#addsub').before(submenu);
}