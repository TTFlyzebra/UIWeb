<?php

namespace app\flyui\controller;

use app\auth\controller\Auth;
use think\Config;
use think\Db;
use think\Request;
use think\Session;

class Themepage extends Auth
{
    public function index()
    {
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $theme = Db::name('theme')->where('themeId', $_GET['id'])->find();
            $pagedatas = Db::name('themepage')
                ->alias('a')
                ->where('a.themeId', (int)$_GET['id'])
                ->join("fly_page b", "a.pageId=b.pageId")
                ->field('b.pageId,b.pageName,width,height')
                ->select();
            if (sizeof($pagedatas) > 0) {
                for ($i = 0; $i < sizeof($pagedatas); $i++) {
                    $pageIds[$i] = $pagedatas[$i]['pageId'];
                }
            }
        } else {
            $theme = [
                'themeId' => "",
                "screenWidth" => 1024,
                "screenHeight" => 600,
                "themeName" => "TEST"
            ];
            $pagedatas = [];
            $pageIds = [];
        }
        $pages = Db::name('page')->alias('a')
            ->where('a.status', 1)
            ->join("fly_theme b", "a.themeId=b.themeId")
            ->field(['a.pageId', 'a.pageName', 'a.themeId', 'a.imageurl', 'a.backcolor', 'a.width', 'a.height',
                'a.remark', 'a.edittime', 'b.themeName'])
            ->select();
        $this->assign("item", $theme);
        $this->assign('list1', $pages);
        $this->assign('list2', $pagedatas);
        $this->assign('pageIds', $pageIds);
        return $this->fetch();
    }

    public function toppage()
    {
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $item = Db::name('theme')
                ->where('themeId', $_GET['id'])
                ->field('userid,ip,edittime', true)
                ->find();
        } else {
            $item = [
                'themeId' => "",
                "pageName" => "",
                "imageurl" => "",
                "backcolor" => "",
                "screenWidth" => 1024,
                "screenHeight" => 600,
                "themeName" => "TEST"
            ];
        }
        $this->assign('item', $item);
        return $this->fetch();
    }
}
