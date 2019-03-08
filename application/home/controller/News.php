<?php

namespace app\home\controller;

use app\auth\controller\Auth;
use think\Db;
use think\Request;

class News extends Auth
{
    public function index()
    {
        return $this->fetch();
    }

    public function add()
    {
        return $this->fetch();
    }

    public function edit()
    {
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $db = Db::name('news');
            $item = $db->where('newsId', $_GET['id'])->find();
            $this->assign('item', $item);
            return $this->fetch();
        }
    }
}
