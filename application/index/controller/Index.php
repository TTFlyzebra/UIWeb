<?php

namespace app\index\controller;

use think\Controller;
use think\Db;

class Index extends Controller {
	public function index() {
        $this->assign('list1',Db::name('welcome')->where('status', 1)->select());
		return $this->fetch ();
	}
}
