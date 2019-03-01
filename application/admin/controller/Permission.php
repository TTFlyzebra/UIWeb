<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class Permission extends Controller
{
    public function index()
    {
        echo __DIR__;
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
            $db = Db::name('about');
            $item = $db->where('aboutId', $_GET['id'])->find();
            $this->assign('item', $item);
            return $this->fetch();
        }
    }
}
