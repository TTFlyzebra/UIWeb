<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;

class Index extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

    public function welcome(){
        echo "景安驰后台管理系统";
    }
}
