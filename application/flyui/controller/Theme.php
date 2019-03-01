<?php

namespace app\flyui\controller;

use think\Controller;
use think\Db;
use think\Request;

class Theme extends Controller {
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
            $db = Db::name('theme');
            $item = $db->where('themeId', $_GET['id'])->find();
            $this->assign('item', $item);
        }
        return $this->fetch();
    }
}
