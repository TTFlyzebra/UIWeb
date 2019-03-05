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

class Register extends Validate
{
    protected $rule = [
        'loginname' => 'require',
        'loginword' => 'require',
        'email' => 'email',
        'mobile' => 'require|max:11|/^1[3-8]{1}[0-9]{9}$/'
    ];

    protected $message = [
        'loginname.require' => '账号不能为空！',
        'loginword.require' => '密码不能为空！',
        'email' =>  '邮箱格式错误',
        'mobile' => '手机号码格式不正确'
    ];

}