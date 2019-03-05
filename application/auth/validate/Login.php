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

class Login extends Validate
{
    protected $rule = [
        'loginname'             => 'require',
        'loginword'             => 'require|max:64'
    ];

    protected $message  =   [
        'loginname.require'              => '账号不能为空！',
        'loginword.require'              => '密码不能为空！',
        'loginword.max'                  => '密码最多不能超过64个字符！',
    ];




}