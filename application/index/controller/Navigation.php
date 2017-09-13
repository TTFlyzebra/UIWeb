<?php

namespace app\index\controller;

use think\Controller;// 引入Controller类

class Navigation extends Controller {
    public function index() {
        $name = "UI管理模块";
        $this->assign('name',$name);
        return $this->fetch ();
    }
}
