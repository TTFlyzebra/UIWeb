<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;

class Index extends Controller {
	public function index() {
        $celltypes = Db::name("celltype")->select();
        dump($celltypes);
		return $this->fetch ();
	}
}
