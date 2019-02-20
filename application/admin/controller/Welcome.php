<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class Welcome extends Controller {
	public function index() {
//        $images=M("welcome")->select();
        $this->assign('list',"");
        $this->assign('imgnum',4);
		return $this->fetch ();
	}
}
