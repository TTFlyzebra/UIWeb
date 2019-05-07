<?php

namespace app\flyui\controller;

use app\auth\controller\Auth;
use think\Db;

class Test extends Auth
{
    public function index()
    {
        $celltypes = Db::name('celltype')->where('status',1)->select();
        $this->assign('celltypes', $celltypes);
        $themes = Db::name('theme')->where('status',1)->select();
        $this->assign('themes', $themes);
        return $this->fetch();
    }

}
