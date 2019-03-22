<?php

namespace app\flyui\controller;

use app\auth\controller\Auth;
use think\Db;
use think\Request;

class Themepage extends Auth
{
    public function index()
    {
        $request = Request::instance();
        $theme['themeId'] = -1;
        $theme['screenWidth'] = 1024;
        $theme['screenHeight'] = 600;
        $theme['themeName'] = "";
        $pages = null;
        $pagedatas = null;
        $pageIds = array();
        if ($request->has('id', 'get')) {
            $db = Db::name('page');
            $theme = Db::name('theme')->where('themeId', $_GET['id'])->find();
            $pages = $db->select();
            $pagedatas = Db::name('themepage')
                ->where('themeId', (int)$_GET['id'])
                ->alias('a')
                ->join("fly_page b", "a.pageId=b.pageId")
                ->field('b.pageId,b.pageName,width,height')
                ->select();
            if (sizeof($pagedatas) > 0) {
                for ($i = 0; $i < sizeof($pagedatas); $i++) {
                    $pageIds[$i] = $pagedatas[$i]['pageId'];
                }
            }
        } else {
            $theme['themeId'] = -1;
            $theme['screenWidth'] = 1024;
            $theme['screenHeight'] = 600;
            $theme['themeName'] = "";
            $pages = null;
            $pagedatas = null;
        }
        $this->assign('list1', $pages);
        $this->assign("item", $theme);
        $this->assign('list2', $pagedatas);
        $this->assign('pageIds', $pageIds);
        return $this->fetch();
    }

    public function toppage(){
        $db= Db::name('page');
        $pages = $db->select();
        $this->assign('list',$pages);

        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $item = Db::name('page')->where('pageId', $_GET['id'])->find();
        }else{
            $item = [];
        }
        $this->assign('item', $item);
        return $this->fetch();
    }
}
