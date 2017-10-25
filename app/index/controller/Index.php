<?php

namespace app\index\controller;

use think\Controller;
use think\Db;

class Index extends Controller {
	public function index() {
        $db= Db::name('celltype');
        $celltypes = $db->select();
        $this->assign('list',$celltypes);
		return $this->fetch ();
	}
}
