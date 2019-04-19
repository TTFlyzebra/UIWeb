<?php

function getRecvAction(){
    $filename = "./config/ActionKey.java";
    $handle = fopen($filename, "r");//读取二进制文件时，需要将第二个参数设置成'rb'
    $filetext = fread($handle, filesize ($filename));
    fclose($handle);
    $str = str_replace(array("\r\n", "\r", "\n"), "", $filetext);
    $ret1 = preg_match_all("/[0-9]{1,8};\/\//",$str,$nums);
    $ret2 = preg_match_all("/;\/\/[^ -~]*/",$str,$tags);
    $nums =  $nums[0];
    $tags = $tags[0];
    if($ret1&&$ret2&&(count($nums)==count($tags))){
        $action = [];
        for($i=0;$i<count($nums);$i++){
            $action[$i]['value'] = str_replace(";//",'',$nums[$i]);
            $action[$i]['tag'] = str_replace(";//",'',$tags[$i]);
        }
        return $action;
    }
    return null;
}

function getSendAction(){
    $filename = "./config/ActionKey.java";
    $handle = fopen($filename, "r");//读取二进制文件时，需要将第二个参数设置成'rb'
    $filetext = fread($handle, filesize ($filename));
    fclose($handle);
    $str = str_replace(array("\r\n", "\r", "\n"), "", $filetext);
    $ret1 = preg_match_all("/[0-9]{1,8};\/\//",$str,$nums);
    $ret2 = preg_match_all("/;\/\/[^ -~]*/",$str,$tags);
    $nums =  $nums[0];
    $tags = $tags[0];
    if($ret1&&$ret2&&(count($nums)==count($tags))){
        $action = [];
        for($i=0;$i<count($nums);$i++){
            $action[$i]['value'] = str_replace(";//",'',$nums[$i]);
            $action[$i]['tag'] = str_replace(";//",'',$tags[$i]);
        }
        return $action;
    }
    return null;
}

function getGravity(){
    $filename = "./config/Gravity.java";
    $handle = fopen($filename, "r");//读取二进制文件时，需要将第二个参数设置成'rb'
    $filetext = fread($handle, filesize ($filename));
    fclose($handle);
    $str = str_replace(array("\r\n", "\r", "\n"), "", $filetext);
    $ret1 = preg_match_all("/[0-9]{1,8};\/\//",$str,$nums);
    $ret2 = preg_match_all("/;\/\/[^ -~]*/",$str,$tags);
    $nums =  $nums[0];
    $tags = $tags[0];
    if($ret1&&$ret2&&(count($nums)==count($tags))){
        $gravity = [];
        for($i=0;$i<count($nums);$i++){
            $gravity[$i]['value'] = str_replace(";//",'',$nums[$i]);
            $gravity[$i]['tag'] = str_replace(";//",'',$tags[$i]);
        }
        return $gravity;
    }
    return null;
}
