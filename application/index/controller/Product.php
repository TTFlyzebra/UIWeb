<?php

namespace app\index\controller;

use think\Controller;
use think\Db;

class Product extends Controller {
	public function index() {
        $this->assign('list1',Db::name('product')->select());
		return $this->fetch ();
	}
}
