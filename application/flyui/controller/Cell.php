<?php

namespace app\flyui\controller;

use app\auth\controller\Auth;
use think\Db;
use think\Request;

class Cell extends Auth
{
    public function index()
    {
        $celltypes = Db::name('celltype')->select();
        $this->assign('list', $celltypes);
        return $this->fetch();
    }

    public function oldadd()
    {
        $this->assign('list1', Db::name('celltype')->select());
        return $this->fetch();
    }

    public function add()
    {
        $this->assign('list1', Db::name('celltype')->select());
        $this->assign('actions', getAction());
        return $this->fetch();
    }

    public function edit()
    {
        $this->assign('list1', Db::name('celltype')->select());
        $this->assign('actions', getAction());
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $item = Db::name('cell')->where('cellId', $_GET['id'])->find();
            $this->assign('item', $item);
            $subcells = Db::name('cellsub')->where('cellId', $_GET['id'])->where('status',1)->select();
            $this->assign('list2', $subcells);
            $this->assign('subnum', sizeof($subcells));
        }else{
            $this->assign('list2', []);
            $this->assign('subnum', 0);
        }
        return $this->fetch();
    }
}
