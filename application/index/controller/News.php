<?php

namespace app\index\controller;

use think\Controller;
use think\Db;
use think\Request;

class News extends Controller {
	public function index() {
		return $this->fetch ();
	}
	public function detail(){
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $db = Db::name('news');
            $item = $db->where('newsId', $_GET['id'])->find();
            $this->assign('item', $item);
            return $this->fetch ();
        }
        return $this->fetch ();
    }
}
