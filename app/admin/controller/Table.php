<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;

class Table extends Controller {
	public function index() {
	    $db= Db::name('table');
	    $celltypes = $db->select();
	    $this->assign('list',$celltypes);
		return $this->fetch ();
	}
}
