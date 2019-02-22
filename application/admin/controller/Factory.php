<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class Factory extends Controller {
	public function index() {
	    $celltypes = Db::name('celltype')->select();
	    $this->assign('list',$celltypes);
		return $this->fetch ();
	}

	public function add(){
        $this->assign('list1',Db::name('celltype')->select());
        $this->assign('list2',Db::name('theme')->select());
        return $this->fetch ();
    }

    public function edit(){
        $this->assign('list1',Db::name('celltype')->select());
        $this->assign('list2',Db::name('theme')->select());

        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $db = Db::name('cell');
            $item = $db->where('cellId', $_GET['id'])->find();
            $this->assign('item', $item);
            return $this->fetch ();
        }
    }
}
