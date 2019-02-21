<?php

namespace app\index\controller;

use think\Controller;
use think\Db;

class Index extends Controller {
	public function index() {
        $this->assign('list1',Db::name('welcome')->select());
		return $this->fetch ();
	}
}
