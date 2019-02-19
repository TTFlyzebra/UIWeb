<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class Cell extends Controller {
	public function index() {
	    $db= Db::name('celltype');
	    $celltypes = $db->select();
	    $this->assign('list',$celltypes);
		return $this->fetch ();
	}

	public function add(){
        $db= Db::name('celltype');
        $celltypes = $db->select();
        $this->assign('list',$celltypes);
        return $this->fetch ();
    }

    public function edit(){
        $db= Db::name('celltype');
        $celltypes = $db->select();
        $this->assign('list',$celltypes);

        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $db = Db::name('cell');
            $item = $db->where('cellId', $_GET['id'])->find();
            $this->assign('item', $item);
            return $this->fetch ();
        }
    }
}
