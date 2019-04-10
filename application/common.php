<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 * 以Json格式统一返回结果
 * @param string $message
 * @param int $code
 * @param string $data
 * @return false|string
 */
function retJsonMsg($message = "success!", $code = 0, $data = "")
{
    $msg = array();
    $msg['msg'] = $message;
    $msg['code'] = $code;
    $msg['data'] = $data;
    return json_encode($msg);
}

/**
 * 保存数据操作记录
 * @param $event
 * @param $tableName
 * @param $data
 */
function saveLog($event, $tableName='', $data='')
{
    if(!empty($data)){
        $data = json_encode($data);
    }
    \think\Db::name('user_log')->insert(array(
        'event' => $event['name'],
        'tableName' => $tableName,
        'data' => $data,
        'ip' => \think\Request::instance()->ip(),
        'userid' => \think\Session::get('userid'),
    ));
}

function getAction(){
    $filename = "./config/ActionKey.java";
    $handle = fopen($filename, "r");//读取二进制文件时，需要将第二个参数设置成'rb'
    $filetext = fread($handle, filesize ($filename));
    fclose($handle);
    $str = str_replace(array("\r\n", "\r", "\n"), "", $filetext);
    $ret1 = preg_match_all("/[0-9]{1,5};\/\//",$str,$nums);
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