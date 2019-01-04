<?php

function retmsg($message="", $ret="0", $data=""){
    $msg = array();
    $msg['msg']=$message;
    $msg['ret']=$ret;
    $msg['data'] = $data;
    return json_encode($msg);
}