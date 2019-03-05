<?php

namespace app\auth\controller;

use think\Controller;
use think\Db;
use think\Request;

class Register extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function register()
    {
        $request = Request::instance();
        if ($request->isPost()) {
            $param = $request->param();
            $validate = $this->validate($param, 'Register');
            if ($validate === true) {
                if (!captcha_check($param['captcha'])) {
                    echo retJsonMsg("captcha error", -1);
                } else {
                    $user = array();
                    $user['user_name'] = $param['loginname'];
                    if(Db::name('user')->where($user)->find()){
                        echo retJsonMsg("username already register!", -1);
                    }else {
                        $user['password'] = md5($param['loginword']);
                        $user['mobile'] = $param['mobile'];
                        $user['email'] = $param['email'];
                        $user['last_login_time'] = time();
                        $user['status'] = 1;
                        $user['ip'] = $request->ip();
                        $result = Db::name("user")->insert($user);
                        if ($request) {
                            echo retJsonMsg("register successful", 0, $result);
                        } else {
                            echo retJsonMsg("register failed", -1, $result);
                        }
                    }
                }
            } else {
                echo retJsonMsg($validate, -1);
            }
        } else {
            echo retJsonMsg("error!", -1);
        }
    }

}
