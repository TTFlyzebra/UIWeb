<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;

class Uiscreen extends Controller
{
    public function index()
    {
        $db= Db::name('cell');
        $celllist = $db->select();
        $this->assign('list',$celllist);
        return $this->fetch();
    }
}
