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

function retJsonMsg($message="OK!", $code=0, $data=""){
    $msg = array();
    $msg['msg']=$message;
    $msg['code']=$code;
    $msg['data'] = $data;
    return json_encode($msg);
}

/**
 * 重组节点信息
 * @param unknown $node
 * @param number $pid
 */
function node_merge($node, $permissions = null, $pid = 0) {
    $arr = array ();
    foreach ( $node as $v ) {
        if ($v ['pid'] == $pid) {
            if (is_array ( $permissions )) {
                $v ['access'] = in_array ( $v ['id'], $permissions ) ? 1 : 0;
            }

            $v ['child'] = node_merge ( $node, $permissions, $v ['id'] );
            $arr [] = $v;
        }
    }
    return $arr;
}
function path_merge($data) {
    $arr = array ();
    foreach ( $data as $v ) {
        $arr [] = get_path ( $data, $v ['id'] );
    }
    return $arr;
}

/**
 * 获取RBAC所有能访问的节点的路径
 *
 * @param unknown $data
 * @param unknown $id
 * @return string
 */
function get_path($data, $id) {
    foreach ( $data as $v ) {
        if ($v ['id'] != $id)
            continue;
        if ($v ['pid'] == 0) {
            $path = '/' . $v ['name'];
        } else {
            $path = get_path ( $data, $v ['pid'] ) . '/' . $v ['name'];
        }
    }
    return $path;
}

/**
 *
 * [writeArr 写入配置文件方法]**
 * @param [type] $arr   	[要写入的数据]
 * @param [type] $filename 	[文件路径]
 * @return [type] [description]
 *
 */
function write_config_arr($arr, $filename) {
    return file_put_contents ( $filename, "<?php\r\nreturn " . var_export ( $arr, true ) . ";" );
}
