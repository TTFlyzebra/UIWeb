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
