<?php

namespace app\flyui\controller;

use app\auth\controller\Auth;
use think\Db;
use think\Request;

class Cell extends Auth
{
    public function index()
    {
        $celltypes = Db::name('celltype')->where('status',1)->select();
        $this->assign('list', $celltypes);
        return $this->fetch();
    }

    public function edit()
    {
        $celltypes = Db::name('celltype')->where('status',1)->select();
        $this->assign('celltypes', $celltypes);
        $themes = Db::name('theme')->where('status',1)->select();
        $this->assign('themes', $themes);
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $this->assign('id',$_GET['id']);
        }else{
            $this->assign('id',-1);
        }
        return $this->fetch();
    }

}
