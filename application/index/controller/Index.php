<?php

namespace app\index\controller;

use think\Controller;
use think\Db;// 引入Controller类

class Index extends Controller {
	public function index() {
        $name = "UI管理模块";
		$this->assign('name',$name);
        $cell	=	Db::name('cell')->find();
		$this->assign('cell',$cell);
		return $this->fetch ();


	}
}
