<?php
/**
 * Created by PhpStorm.
 * User: Aven
 * E-mail: 741606767@qq.com
 * Date: 2019/1/23
 * Time: 11:12
 */

namespace app\auth\validate;


use think\Validate;

class Permission extends Validate
{
    protected $rule = [
        'name'             => 'require',
        'path'             => 'require',
        'description'             => 'require',
    ];

    protected $message  =   [
        'name.require'              => '节点名称不能为空！',
        'path.require'              => '节点路径不能为空！',
        'description.require'       => '节点描述不能为空！',
    ];




}