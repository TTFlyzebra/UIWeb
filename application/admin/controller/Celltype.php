<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class Celltype extends Controller
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
            $db = Db::name('celltype');
            $item = $db->where('celltypeId', $_GET['id'])->find();
            $this->assign('item', $item);
            return $this->fetch();
        }
    }
}
