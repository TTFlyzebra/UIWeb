<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class Page extends Controller {
	public function index() {
		return $this->fetch ();
	}

    public function add()
    {
        return $this->fetch();
    }

    public function edit()
    {
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $db = Db::name('page');
            $item = $db->where('pageId', $_GET['id'])->find();
            $this->assign('item', $item);
        }
        return $this->fetch();
    }

    public function screen()
    {
        $db= Db::name('page');
        $pages = $db->select();
        $this->assign('list',$pages);

        $request = Request::instance();
        if($request->has('id','get')) {
            $this->assign('pageId', (int)$_GET['id']);
        }else{
            $this->assign('pageId', -1);
        }
        return $this->fetch();
    }
}
