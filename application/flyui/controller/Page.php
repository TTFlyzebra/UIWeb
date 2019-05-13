<?php

namespace app\flyui\controller;

use app\auth\controller\Auth;
use think\Db;
use think\Request;

class Page extends Auth {
	public function index() {
		return $this->fetch ();
	}

    public function add()
    {
        $this->assign('list',Db::name('theme')->select());
        return $this->fetch();
    }

    public function edit()
    {
        $this->assign('list',Db::name('theme')->select());
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $db = Db::name('page');
            $item = $db->where('pageId', $_GET['id'])->find();
        }
        if(empty($item)){
            $item = [
                'pageId' => -1,
                "pageName" => "",
                "imageurl" => "",
                "backcolor" => "",
                "width" => "",
                "height" => "",
                "remark" => ""
            ];
        }
        $this->assign('item', $item);
        return $this->fetch();
    }

    public function screen()
    {
        $db= Db::name('page');
        $pages = $db->select();
        $this->assign('list',$pages);

        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $item = Db::name('page')->where('pageId', $_GET['id'])->find();
        }else{
            $item = Db::name('page')->find();
        }
        $this->assign('item', $item);
        return $this->fetch();
    }
}
