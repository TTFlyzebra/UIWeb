<?php

namespace app\flyui\controller;

use app\auth\controller\Auth;
use think\Db;
use think\Request;
use think\Session;

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

    public function copy(){
        $request = Request::instance();
        if($request->isPost()&&$request->has('id')) {
            $cell = Db::name('cell')->where("cellId",$_POST['id'])->find();
            $cell['description'] = 'new_'.$cell['description'];
            $cell['userid'] = Session::get('userid');
            $cell['ip'] = request()->ip();
            unset($cell['cellId']);
            $result = Db::name('cell')->insert($cell);
            if($result){
                echo retJsonMsg();
            }else{
                echo retJsonMsg("error!",-1);
            }
        }else{
            echo retJsonMsg("error!",-1);
        }
    }

}
