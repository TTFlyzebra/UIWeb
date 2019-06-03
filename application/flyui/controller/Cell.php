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
            $cell['pages'] = '[]';
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

    public function cellpage(){
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $item = Db::name('page')
                ->alias('a')
                ->where('a.pageId', $_GET['id'])
                ->where('a.status', 1)
                ->join("fly_theme b", "a.themeId=b.themeId")
                ->field(['a.pageId', 'a.pageName', 'a.themeId', 'a.imageurl', 'a.backcolor', 'a.width', 'a.height',
                    'a.remark', 'a.edittime', 'b.themeName'])
                ->find();
            $item['pageId'] =  $_GET['id'];
        } else {
            $item = [
                'pageId' => "",
                "backcolor" => "",
                "width" => 512,
                "height" => 60,
            ];
        }
        $item['themeName'] =  "CELL PAGE";
        $item['pageName'] =  "Layout";
        if ($request->has('width', 'get')){
            $item['width'] =  1024;
        }
        if ($request->has('height', 'get')){
            $item['height'] =  600;
        }
        $this->assign('item', $item);
        return $this->fetch();
    }

}
