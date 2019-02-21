<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class News extends Controller
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
