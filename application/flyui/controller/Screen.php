<?php

namespace app\flyui\controller;

use think\Controller;
use think\Db;
use think\Request;

class Screen extends Controller {
	public function index() {
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
