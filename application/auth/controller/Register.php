<?php

namespace app\auth\controller;

use think\Controller;
use think\Request;

class Register extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function register(){
        $request = Request::instance();
        dump($request->param());
//        $this->redirect(url('auth/login/index'));
    }

}
