$("#locus").click(function () {
    var isChecked = $('#locus_input').is(':checked');
    if (isChecked) {
        $("#locus_value").html("开");
        $("[name=locus_input]:checkbox").prop("checked", false);
        $("#locus").addClass("swich-on ");
        // $('#locus_input').attr('checked',true);
    } else {
        $("#locus_value").html("关");
        $("#locus").removeClass("swich-on ");
        $("[name=locus_input]:checkbox").prop("checked", true);

    }
});


$("#radar").click(function () {
    var isChecked = $('#radar_input').is(':checked');
    if (isChecked) {
        $("#radar_value").html("开");
        $("[name=radar_input]:checkbox").prop("checked", false);
        $("#radar").addClass("swich-on ");
        // $('#locus_input').attr('checked',true);
    } else {
        $("#radar_value").html("关");
        $("#radar").removeClass("swich-on ");
        $("[name=radar_input]:checkbox").prop("checked", true);

    }
});

function initialization() {
    if (!$('#locus_input').is(':checked')) {
        $("#locus_value").html("开");
        $("#locus").addClass("swich-on ");
    } else {
        $("#locus_value").html("关");
        $("#locus").removeClass("swich-on ");
    }
    if (!$('#radar_input').is(':checked')) {
        $("#radar_value").html("开");
        $("#radar").addClass("swich-on ");
    } else {
        $("#radar_value").html("关");
        $("#radar").removeClass("swich-on ");
    }
    var radar_left_right = $('#radar_left_right').is(':checked');
    var radar_top_bottom = $('#radar_top_bottom').is(':checked');
    if (radar_left_right) {
        if (radar_top_bottom) {
            $("#Mirror_value").html("上下镜像，左右镜像");
        } else {
            $("#Mirror_value").html("左右镜像");
        }
        // $('#locus_input').attr('checked',true);
    } else {
        if (radar_top_bottom) {
            $("#Mirror_value").html("上下镜像");
        } else {
            $("#Mirror_value").html("关闭镜像");
        }

    }
    if (!$('#protocol_input').is(':checked')) {
        $("#protocol_value").html("开");
        $("#protocol").addClass("swich-on ");

    } else {
        $("#protocol_value").html("关");
        $("#protocol").removeClass("swich-on ");
    }

    if (!$('#USB_modes input[name="USB_mode"]:checked ').attr('value') == 0) {
        $("#USB_mode_value").html("USB2.0");
    } else {
        $("#USB_mode_value").html("USB1.0");
    }
    if (!$('#USB_Types input[name="USB_Types"]:checked ') == 0) {

        $("#USB_Types_value").html("MTP/host");

        // $('#locus_input').attr('checked',true);
    } else {
        $("#USB_Types_value").html("OTG/device");
    }
    if (!$('#Auxiliary_input').is(':checked')) {
        $("#Auxiliary_value").html("显示");
        $("#Auxiliary").addClass("swich-on ");
    } else {
        $("#Auxiliary_value").html("隐藏");
        $("#Auxiliary").removeClass("swich-on ");
    }
    if (!$('#Mute_input').is(':checked')) {
        $("#Mute_value").html("开");
        $("#Mute").addClass("swich-on ");

    } else {
        $("#Mute_value").html("关");
        $("#Mute").removeClass("swich-on ");
    }


    if (!$('#Button_light_always_on_input').is(':checked')) {
        $("#Button_light_always_on_value").html("开");
        $("#Button_light_always_on").addClass("swich-on ");
    } else {
        $("#Button_light_always_on_value").html("关");
        $("#Button_light_always_on").removeClass("swich-on ");
    }

    if (!$('#mcuLog_input').is(':checked')) {
        $("#mcuLog_value").html("开");
        $("#mcuLog").addClass("swich-on ");
    } else {
        $("#mcuLog_value").html("关");
        $("#mcuLog").removeClass("swich-on ");
    }


    if (!$('#Colorful_lights_input').is(':checked')) {
        $("#Colorful_lights_value").html("自动");
        $(".colors").hide();
        $("#Colorful_lights").addClass("swich-on ");

    } else {
        $("#Colorful_lights").removeClass("swich-on ");
        $(".colors").show();
        $("#Colorful_lights_value").css({"color": "rgb(" + $('#red').attr('value') + ", " + $('#green').attr('value') + ", " + $('#blue').attr('value') + ")"})
        $("#Colorful_lights_value").html("手动");
    }
    $("#brightness_value").html($('#brightness').attr('value') + "%");
    $("#chroma_value").html($('#chroma').attr('value') + "%");
    $("#contrast_value").html($('#contrast').attr('value') + "%");
    $("#color_R_value").html($('#red').attr('value'));
    $("#color_G_value").html($('#green').attr('value'));
    $("#color_B_value").html($('#blue').attr('value'));
    $("#Shutdown_time_value").html($('#Shutdown_time').attr('value') + "s");


    if (!$('#music_input').is(':checked')) {
        $("#music").addClass("swich-on ");
    } else {
        $("#music").removeClass("swich-on ");

    }
    if (!$('#DVR_Enhanced_mode_input').is(':checked')) {
        $("#DVR_Enhanced_mode").addClass("swich-on ");
    } else {
        $("#DVR_Enhanced_mode").removeClass("swich-on ");

    }
    if (!$('#DVR_Enhanced_mode1_input').is(':checked')) {
        $("#DVR_Enhanced_mode1").addClass("swich-on ");
    } else {
        $("#DVR_Enhanced_mode1").removeClass("swich-on ");

    }

    if (!$('#bRearDisplay_input').is(':checked')) {
        $("#bRearDisplay_vlaue").html("开");

        $("#bRearDisplay").addClass("swich-on ");
        // $('#locus_input').attr('checked',true);
    } else {
        $("#bRearDisplay_vlaue").html("关");
        $("#bRearDisplay").removeClass("swich-on ");
    }

    if (!$('#bRadioRDS_input').is(':checked')) {
        $("#bRadioRDS_vlaue").html("开");

        $("#bRadioRDS").addClass("swich-on ");
        // $('#locus_input').attr('checked',true);
    } else {
        $("#bRadioRDS_vlaue").html("关");
        $("#bRadioRDS").removeClass("swich-on ");


    }
    $('#brightness').css('background', 'linear-gradient(to right, #059CFA, white ' + $('#brightness').attr('value') * 12 + '%, white)');
    $('#chroma').css('background', 'linear-gradient(to right, #059CFA, white ' + $('#chroma').attr('value') * 12 + '%, white)');
    $('#contrast').css('background', 'linear-gradient(to right, #059CFA, white ' + $('#contrast').attr('value') * 12 + '%, white)');
    $('#red').css('background', 'linear-gradient(to right, #FF0000, white ' + $('#red').attr('value') * (100 / 255) + '%, white)');
    $('#green').css('background', 'linear-gradient(to right, #00FF00, white ' + $('#green').attr('value') * (100 / 255) + '%, white)');
    $('#blue').css('background', 'linear-gradient(to right, #0000FF, white ' + $('#blue').attr('value') * (100 / 255) + '%, white)');
    $('#Shutdown_time').css('background', 'linear-gradient(to right, #059CFA, white ' + $('#Shutdown_time').attr('value') * (100 / 180) + '%, white)');
    $(".box-5").addClass("box-4");
    $(".box-5").removeClass("box-5");

    $("#logo_" + LOGo + "").children().addClass("box-5");
    $("#logo_" + LOGo + "").children().removeClass("box-4");
}

$(".Left_right").click(function () {
    var radar_left_right = $('#radar_left_right').is(':checked');
    var radar_top_bottom = $('#radar_top_bottom').is(':checked');
    if (radar_left_right) {

        if (radar_top_bottom) {
            $("#Mirror_value").html("上下镜像，左右镜像");
        } else {
            $("#Mirror_value").html("左右镜像");
        }
        // $('#locus_input').attr('checked',true);
    } else {
        if (radar_top_bottom) {
            $("#Mirror_value").html("上下镜像");
        } else {
            $("#Mirror_value").html("关闭镜像");
        }


    }
});
$(".top_bottom").click(function () {
    var radar_left_right = $('#radar_left_right').is(':checked');
    var radar_top_bottom = $('#radar_top_bottom').is(':checked');
    if (radar_left_right) {

        if (radar_top_bottom) {
            $("#Mirror_value").html("上下镜像，左右镜像");
        } else {
            $("#Mirror_value").html("左右镜像");
        }
        // $('#locus_input').attr('checked',true);
    } else {
        if (radar_top_bottom) {
            $("#Mirror_value").html("上下镜像");
        } else {
            $("#Mirror_value").html("关闭镜像");
        }


    }
});

$("#protocol").click(function () {
    var isChecked = $('#protocol_input').is(':checked');
    if (isChecked) {
        $("#protocol_value").html("开");
        $("[name=protocol_input]:checkbox").prop("checked", false);
        $("#protocol").addClass("swich-on ");
        // $('#locus_input').attr('checked',true);
    } else {
        $("#protocol_value").html("关");
        $("#protocol").removeClass("swich-on ");
        $("[name=protocol_input]:checkbox").prop("checked", true);

    }
});

$('#USB_modes input[name="USB_mode"]').click(function () {
    var isChecked = $('#USB_modes input[name="USB_mode"]:checked ').attr('value');
    if (isChecked == 0) {

        $("#USB_mode_value").html("USB2.0");

    } else {
        $("#USB_mode_value").html("USB1.0");


    }
});
$('#USB_Types input[name="USB_Types"]').click(function () {
    var isChecked = $('#USB_Types input[name="USB_Types"]:checked ');
    if (isChecked == 0) {

        $("#USB_Types_value").html("MTP/host");

        // $('#locus_input').attr('checked',true);
    } else {
        $("#USB_Types_value").html("OTG/device");


    }
});

$("#Auxiliary").click(function () {
    var isChecked = $('#Auxiliary_input').is(':checked');
    if (isChecked) {
        $("#Auxiliary_value").html("显示");
        $("[name=Auxiliary_input]:checkbox").prop("checked", false);
        $("#Auxiliary").addClass("swich-on ");
        // $('#locus_input').attr('checked',true);
    } else {
        $("#Auxiliary_value").html("隐藏");
        $("#Auxiliary").removeClass("swich-on ");
        $("[name=Auxiliary_input]:checkbox").prop("checked", true);

    }
});
$("#Mute").click(function () {
    var isChecked = $('#Mute_input').is(':checked');
    if (isChecked) {
        $("#Mute_value").html("开");
        $("[name=Mute_input]:checkbox").prop("checked", false);
        $("#Mute").addClass("swich-on ");
        // $('#locus_input').attr('checked',true);
    } else {
        $("#Mute_value").html("关");
        $("#Mute").removeClass("swich-on ");
        $("[name=Mute_input]:checkbox").prop("checked", true);

    }
});


$.fn.RangeSlider = function (cfg, _value, color, v) {
    this.sliderCfg = {
        min: cfg && !isNaN(parseFloat(cfg.min)) ? Number(cfg.min) : null,
        max: cfg && !isNaN(parseFloat(cfg.max)) ? Number(cfg.max) : null,
        step: cfg && Number(cfg.step) ? cfg.step : 1,
        callback: cfg && cfg.callback ? cfg.callback : null
    };

    var $input = $(this);
    var min = this.sliderCfg.min;
    var max = this.sliderCfg.max;
    var step = this.sliderCfg.step;
    var callback = this.sliderCfg.callback;

    $input.attr('min', min)
        .attr('max', max)
        .attr('step', step);

    $input.bind("input", function (e) {
        $input.attr('value', this.value);
        var ad;
        if (v == 12) {
            ad = this.value * v;
        } else {
            ad = this.value * (100 / v);
        }

        $input.css('background', 'linear-gradient(to right, ' + color + ', white ' + ad + '%, white)');
        console.log(ad);

        if ($.isFunction(callback)) {
            callback($input, _value, v);
        }
    });
};

$("#music").click(function () {
    var isChecked = $('#music_input').is(':checked');
    if (isChecked) {

        $("[name=music_input]:checkbox").prop("checked", false);
        $("#music").addClass("swich-on ");
        // $('#locus_input').attr('checked',true);
    } else {

        $("#music").removeClass("swich-on ");
        $("[name=music_input]:checkbox").prop("checked", true);

    }
});

$("#DVR_Enhanced_mode").click(function () {
    var isChecked = $('#DVR_Enhanced_mode_input').is(':checked');
    if (isChecked) {

        $("[name=DVR_Enhanced_mode_input]:checkbox").prop("checked", false);
        $("#DVR_Enhanced_mode").addClass("swich-on ");
        // $('#locus_input').attr('checked',true);
    } else {
        $("#DVR_Enhanced_mode").removeClass("swich-on ");
        $("[name=DVR_Enhanced_mode_input]:checkbox").prop("checked", true);

    }
});
$("#DVR_Enhanced_mode1").click(function () {
    var isChecked = $('#DVR_Enhanced_mode1_input').is(':checked');
    if (isChecked) {

        $("[name=DVR_Enhanced_mode1_input]:checkbox").prop("checked", false);
        $("#DVR_Enhanced_mode1").addClass("swich-on ");
        // $('#locus_input').attr('checked',true);
    } else {
        $("#DVR_Enhanced_mode1").removeClass("swich-on ");
        $("[name=DVR_Enhanced_mode1_input]:checkbox").prop("checked", true);

    }
});
$("#Button_light_always_on").click(function () {
    var isChecked = $('#Button_light_always_on_input').is(':checked');
    if (isChecked) {
        $("#Button_light_always_on_value").html("开");
        $("[name=Button_light_always_on_input]:checkbox").prop("checked", false);
        $("#Button_light_always_on").addClass("swich-on ");
        // $('#locus_input').attr('checked',true);
    } else {
        $("#Button_light_always_on_value").html("关");
        $("#Button_light_always_on").removeClass("swich-on ");
        $("[name=Button_light_always_on_input]:checkbox").prop("checked", true);

    }
});

$("#mcuLog").click(function () {
    var isChecked = $('#mcuLog_input').is(':checked');
    if (isChecked) {
        $("#mcuLog_value").html("开");
        $("[name=mcuLog_input]:checkbox").prop("checked", false);
        $("#mcuLog").addClass("swich-on ");
        // $('#locus_input').attr('checked',true);
    } else {
        $("#mcuLog_value").html("关");
        $("#mcuLog").removeClass("swich-on ");
        $("[name=mcuLog_input]:checkbox").prop("checked", true);

    }
});

$("#bRearDisplay").click(function () {
    var isChecked = $('#bRearDisplay_input').is(':checked');
    if (isChecked) {
        $("#bRearDisplay_vlaue").html("开");
        $("[name=bRearDisplay_input]:checkbox").prop("checked", false);
        $("#bRearDisplay").addClass("swich-on ");
        // $('#locus_input').attr('checked',true);
    } else {
        $("#bRearDisplay_vlaue").html("关");
        $("#bRearDisplay").removeClass("swich-on ");
        $("[name=bRearDisplay_input]:checkbox").prop("checked", true);

    }
});

$("#bRadioRDS").click(function () {
    var isChecked = $('#bRadioRDS_input').is(':checked');
    if (isChecked) {
        $("#bRadioRDS_vlaue").html("开");
        $("[name=bRadioRDS_input]:checkbox").prop("checked", false);
        $("#bRadioRDS").addClass("swich-on ");
        // $('#locus_input').attr('checked',true);
    } else {
        $("#bRadioRDS_vlaue").html("关");
        $("#bRadioRDS").removeClass("swich-on ");
        $("[name=bRadioRDS_input]:checkbox").prop("checked", true);

    }
});
$("#Colorful_lights").click(function () {
    var isChecked = $('#Colorful_lights_input').is(':checked');
    if (isChecked) {
        $("#Colorful_lights_value").html("自动");
        $(".colors").hide();
        $("#Colorful_lights_value").css({"color": "#777"})
        $("[name=Colorful_lights_input]:checkbox").prop("checked", false);
        $("#Colorful_lights").addClass("swich-on ");
        // $('#locus_input').attr('checked',true);
    } else {
        $(".colors").show();
        $("#Colorful_lights_value").css({"color": "rgb(" + $('#red').attr('value') + ", " + $('#green').attr('value') + ", " + $('#blue').attr('value') + ")"})

        $("#Colorful_lights_value").html("手动");
        $("#Colorful_lights").removeClass("swich-on ");
        $("[name=Colorful_lights_input]:checkbox").prop("checked", true);

    }
});


$("#button_color_red").click(function () {
    setColor(255, 0, 0);
});
$("#button_color_green").click(function () {
    setColor(0, 255, 0);
});
$("#button_color_blue").click(function () {
    setColor(0, 0, 255);
});
$("#button_color_Rose_red").click(function () {
    setColor(255, 30, 255);
});
$("#button_color_light_green").click(function () {
    setColor(100, 255, 100);
});
$("#button_color_light_blue").click(function () {
    setColor(100, 200, 200);
});
$("#button_color_yellow").click(function () {
    setColor(255, 255, 0);
});
$("#button_color_white").click(function () {
    setColor(255, 255, 255);
});
$("#button_color_orange").click(function () {
    setColor(255, 102, 0);
});

function setColor(R, G, B) {
    document.getElementById("red").value = R + "";
    $('#red').val(R)
    $('#green').val(G)
    $('#blue').val(B)
    $('#red').attr({"value": R});
    $('#green').attr({"value": G});
    $('#blue').attr({"value": B});
    $("#color_R_value").html($('#red').attr('value'))
    $("#color_G_value").html($('#green').attr('value'))
    $("#color_B_value").html($('#blue').attr('value'))
    $('#red').css('background', 'linear-gradient(to right, #FF0000, white ' + $('#red').attr('value') * (100 / 255) + '%, white)');
    $('#green').css('background', 'linear-gradient(to right, #00FF00, white ' + $('#green').attr('value') * (100 / 255) + '%, white)');
    $('#blue').css('background', 'linear-gradient(to right, #0000FF, white ' + $('#blue').attr('value') * (100 / 255) + '%, white)');
    $('#red').attr({"value": R});
    $('#green').attr({"value": G});
    $('#blue').attr({"value": B});
    $("#Colorful_lights_value").css({"color": "rgb(" + $('#red').attr('value') + ", " + $('#green').attr('value') + ", " + $('#blue').attr('value') + ")"})

}

var LOGo = 0

function js_method(i) {
    console.log(i);
    $(".box-5").addClass("box-4");
    $(".box-5").removeClass("box-5");
    LOGo = i;
    $("#logo_" + i + "").children().addClass("box-5");
    $("#logo_" + i + "").children().removeClass("box-4");


}


function changes($v) {
    var tmp = $v;
    // alert(tmp.tagName);
    $(".active").removeClass("active");
    $(tmp).addClass("active")

    /*var imageId=tmp.attr("id");
    alert(imageId);*/

}

$("input[type=radio]").click(function () {

});

/*$("#upfile").click();
$("#upfile").on("change", function () {

    var path=$("#upfile").val();
    //加载本地文件
    parseXML("C:/Users/ouyan/Desktop/globaldata.xml ")
});*/
function parseXML(xmlFile, data, bool) {

    if (bool == "bool") {
        $("." + xmlFile + "").prop("checked", !data);
    } else {
        if (xmlFile == "byButtonLightColor") {
            if (data == 0) {

                $("." + xmlFile + "").prop("checked", false);
            } else {
                $("." + xmlFile + "").prop("checked", true);
            }
        } else if (xmlFile == "byBackCarScreen") {
            if (data == 0) {
                $('#radar_left_right').prop("checked", false);
                $('#radar_top_bottom').prop("checked", false);
            } else if (data == 1) {
                $('#radar_left_right').prop("checked", true);
                $('#radar_top_bottom').prop("checked", false);
            } else if (data == 2) {
                $('#radar_left_right').prop("checked", false);
                $('#radar_top_bottom').prop("checked", true);
            } else {
                $('#radar_left_right').prop("checked", true);
                $('#radar_top_bottom').prop("checked", true);
            }

        } else if (xmlFile == "byUsbMode") {

            $("input[name=USB_mode]:eq(" + data + ")").prop("checked", 'checked');
        } else if (xmlFile == "byUsbRate") {

            $("input[name=USB_Types]:eq(" + data + ")").prop("checked", 'checked');
        } else if (xmlFile == "byRadioLocal") {

            $("input[name=Radio]:eq(" + data + ")").prop("checked", 'checked');
        } else if (xmlFile == "byLogoIndex") {
            LOGo = data;
        } else {

            $("." + xmlFile + "").val(data)
            $("." + xmlFile + "").attr({"value": data});
        }
    }
    initialization();
}

function fileSelect3(e) {

    e = e || window.event;

    var files = this.files;
    var p = document.getElementById('preview3');
    for (var i = 0, f; f = files[i]; i++) {
        var reader = new FileReader();
        reader.onload = (function (files) {
            return function (xml) {

                var $xmlDoc = $($.parseXML(this.result));
                var $globaldata = $xmlDoc.find("globaldata");
                var $FactorySettings = $globaldata.find("FactorySettings");
                var $names = $FactorySettings.find("Data");
                for (var i = 0; i < ($names).length; i++) {
                    parseXML($($names[i]).attr("_key"), $($names[i]).attr("_data"), $($names[i]).attr("_datatype"));
                }


            };
        })(f);
        //读取文件内容
        reader.readAsText(f);
    }
    $("#upfile").val("")
    // alert("");
    /*   $.message({
           message:'配置文件导入成功',

       });*/
    $.message('配置文件导入成功');
    /*  $.ajax({
          url: "C:/Users/ouyan/Desktop/globaldata.xml",
          type: 'GET',
          dataType: 'xml',
          timeout: 1000,  //设定超时
          cache: false,   //禁用缓存
          error: function(xml) {
              alert("加载XML文档出错!");
          },
          success: GetStudentComplete   //设置成功后回调函数
      });*/
}

/**/
/*$(document).off('change','#upfile').on('change','#upfile',fileSelect3);*/
$("#upfile").click();
$("#upfile").change(fileSelect3);
/*$("body").delegate('#upfile', 'change', fileSelect3);*/

/*
document.getElementById('upfile').addEventListener('change', fileSelect3, false);
*/

function GetStudentComplete(xml) {

    $(xml).find("FactorySettings").each(function (i) {     //查找所有student节点并遍历
        //获得子节点
        //  console.log("节点"+id);
        var _key = $(this).children("Data").attr("_key");
        var _data = $(this).children("Data").attr("_data");
        //获取节点文本


        console.log("student 节点下_key的内容" + _key + " userid的_data 属性" + _data);

    });
}

$("#sbutton").click(function () {
    var mirror;
    var radar_left_right = $('#radar_left_right').is(':checked');
    var radar_top_bottom = $('#radar_top_bottom').is(':checked');
    if (radar_left_right) {

        if (radar_top_bottom) {
            mirror = 3
        } else {
            mirror = 2
        }
        // $('#locus_input').attr('checked',true);
    } else {
        if (radar_top_bottom) {
            mirror = 1
        } else {
            mirror = 0
        }


    }
    var ada = [
        {
            _key: "bBackCarTrack",//倒车轨迹
            _datatype: "bool",
            _data: !($('#locus_input').is(':checked')),//倒车轨迹
        },
        {
            _key: "bBackCarRadar",//倒车轨迹
            _datatype: "bool",
            _data: !($('#radar_input').is(':checked')),//倒车雷达
        },
        {
            _key: "byBackCarScreen",//倒车镜像
            _datatype: "byte",
            _data: mirror
        },
        {
            _key: "bBackCarSubline",//协议方控
            _datatype: "bool",
            _data: !($('#protocol_input').is(':checked')),//倒车辅助线

        },
        {
            _key: "bCarInfoIcon",//倒车辅助线
            _datatype: "bool",
            _data: !($('#Auxiliary_input').is(':checked')),//倒车辅助线

        },

        {
            _key: "bBackCarIsNeedMute",//倒车静音
            _datatype: "bool",//倒车静音
            _data: !($('#Mute_input').is(':checked')),//倒车静音

        },
        {
            _key: "byBrightnessDS",//亮度
            _datatype: "byte",
            _data: $('#brightness').attr('value'),

        },
        {
            _key: "byChromaDS",//色度
            _datatype: "byte",
            _data: $('#chroma').attr('value'),

        }
        ,
        {
            _key: "byContrastDS",//对比度
            _datatype: "byte",
            _data: $('#contrast').attr('value'),

        }
        ,
        {
            _key: "byUsbRate",//USB接口类型
            _datatype: "byte",
            _data: $('#USB_Types input[name="USB_Types"]:checked ').attr('value')


        },
        {
            _key: "byUsbMode",//USB工作模式
            _datatype: "byte",
            _data: $('#USB_modes input[name="USB_mode"]:checked ').attr('value'),


        },
        {
            _key: "bIsNeedAutoPlayMusic",//音乐设置
            _datatype: "bool",
            _data: !($('#music_input').is(':checked')),//倒车静音


        },
        {
            _key: "bUsb0Dvr",//音乐设置
            _datatype: "bool",
            _data: !($('#DVR_Enhanced_mode_input').is(':checked')),//倒车静音


        },
        {
            _key: "bUsb1Dvr",//音乐设置
            _datatype: "bool",
            _data: !($('#DVR_Enhanced_mode1_input').is(':checked')),//倒车静音


        }, {
            _key: "bButtonLight",//按键灯常亮
            _datatype: "bool",
            _data: !($('#Button_light_always_on_input').is(':checked')),//倒车静音


        }, {
            _key: "bMcuLog",//打印mcuLog
            _datatype: "bool",
            _data: !($('#mcuLog_input').is(':checked')),//倒车静音


        }, {
            _key: "byButtonLightColor",//七彩灯设置
            _datatype: "byte",
            _data: (!($('#Colorful_lights_input').is(':checked'))) ? "1" : "0",//倒车静音


        }
        , {
            _key: "byRedColor",//七彩灯R
            _datatype: "byte",
            _data: $('#red').attr('value'),//倒车静音


        }
        , {
            _key: "byGreenColor",//七彩灯G
            _datatype: "byte",
            _data: $('#green').attr('value'),//倒车静音

        }
        , {
            _key: "byBlueColor",//七彩灯B
            _datatype: "byte",
            _data: $('#blue').attr('value'),//倒车静音
        }
        , {
            _key: "byRadioLocal",//收音区域
            _datatype: "byte",
            _data: $('.radio:checked ').attr('value'),

        },
        {
            _key: "bRadioRDS",//后排输入显示开关
            _datatype: "byte",
            _data: !($('#bRadioRDS_input').is(':checked')),

        }, {
            _key: "bRearDisplay",//RDS开关
            _datatype: "byte",
            _data: !($('#bRearDisplay_input').is(':checked')),

        }, {
            _key: "byStandByTime",//关机时间
            _datatype: "byte",
            _data: $('#Shutdown_time').attr('value'),

        }, {
            _key: "byLogoIndex",//开机logo
            _datatype: "byte",
            _data: LOGo + "",

        }

    ]

    var data = {
        FactorySettings: {

            Data: ada

        }
    };
    /*      bBackCarTrack:!($('#locus_input').is(':checked')),//倒车轨迹
              bBackCarRadar:!($('#radar_input').is(':checked')),//倒车雷达
              bBackCarSubline:!($('#Auxiliary_input').is(':checked')),//倒车辅助线*/
    var as = JSON.stringify(data);
    // console.log(as );
    $.ajax({
        type: 'POST',
        url: postseturl,
        data: {'factory': as},
        // contentType: "application/json; charset=utf-8",
        success: function (result) {
            console.log(result);
            var data = JSON.parse(result);
            var downLink = document.createElement('a');
            downLink.href = data.url;
            downLink.download = data.filename;
            downLink.click()
            window.location.href = data.url;
        }
    });

    /*$.post("http://192.168.1.119:801/jancarweb/api/Factory", as,

         function(data){
             var  aaf= JSON.parse(data);

             console.log(aaf.url );
             var a = document.createElement('a');

       /!*      var url = 'http://192.168.1.122:8080/untitled';

             var filename = 'globaldata.xml';*!/


             a.href=aaf.url;

             a.download = aaf.filename;

             a.click()
             console.log(data );
         });
*/
    //   $.download('/FileExport/DownLoadFile', 'post', "C:/Users/ouyan/Desktop/globaldata.xml"); // 下载文件
    /*  $.post("http://192.168.1.119:801/jancarweb/api/Factory", a,

          function(data){
              console.log(data );
              $.download('/FileExport/DownLoadFile', 'post', "C:/Users/ouyan/Desktop/globaldata.xml"); // 下载文件
          });*/


    /*    $.ajax({
            type: 'POST',
            url: "http://192.168.1.119:801/jancarweb/api/Factory",
            data: data,
            success: success,
            dataType: dataType
        });*/

});
