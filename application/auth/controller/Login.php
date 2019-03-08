<?php

namespace app\auth\controller;

use app\auth\common\Rbac;
use think\Controller;
use think\Db;
use think\Request;
use think\Session;

class Login extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function login()
    {
        $request = Request::instance();
        if ($request->isPost()) {
            $param = $request->param();
            $validate = $this->validate($param, 'Login');
            if (true === $validate) {
                if (!captcha_check($param['captcha'])) {
                    echo retJsonMsg("captcha error", -1);
                } else {
                    $user = array();
                    $user['user_name'] = $param['loginname'];
                    if (Db::name('user')->where($user)->find()) {
                        $user['password'] = md5($param['loginword']);
                        if ($login = Db::name('user')->where($user)->find()) {
                            Session::set('userid', $login['id']);
                            Session::set('user_name', $login['user_name']);
                            $rbacObj = new Rbac();
                            $rbacObj->cachePermission($login['id']);
                            echo retJsonMsg("login successful");
                        } else {
                            echo retJsonMsg("password error", -1);
                        }
                    } else {
                        echo retJsonMsg("no username", -1);
                    }

                }
            } else {
                echo retJsonMsg($validate, -1);
            }
        } else {
            echo retJsonMsg("error", -1);
        }
    }

    public function logout()
    {
        Session::clear();
        $this->redirect(url('auth/login/index'));
    }

}
