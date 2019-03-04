<?php

namespace app\auth\controller;

use think\Controller;
use think\Request;

class Login extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function login(){
        $request = Request::instance();
        if ($request->has('loginname', 'post')&&$request->has('loginword', 'post')){
            if($_POST['loginname']=='admin'&&$_POST['loginword']==md5('123456')){
                session('user_id',$_POST['loginname']);
            }else{
                echo "password error!";
            }
        }else{
            echo "login error!";
        }
    }

    public function logout(){
        session("user_id", NULL);
        $this->redirect(url('auth/login/index'));
    }

}
