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
            $pages = $db->where('status', 1)->select();
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

    public function toppage()
    {
        $db = Db::name('page');
        $pages = $db->where('status', 2)->select();
        $this->assign('list', $pages);

        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $theme = Db::name('theme')
                ->where('themeId', $_GET['id'])
                ->field('userid,ip,edittime', true)
                ->find();
            if (empty($theme['topPageId'])) {
                $page = [];
                $page['pageName'] = 'TOP_PAGE';
                $page['status'] = 2;
                $page['width'] = $theme['screenWidth'];
                $page['height'] = $theme['screenHeight'];
                $page['userid'] = Session::get('userid');
                $page['ip'] = $request->ip();
                $result1 = Db::name('page')->insert($page, false, true);
                if ($result1) {
                    $page['pageId'] = $result1;
                    saveLog(Config::get('event')['add'], 'page', $page);
                    $theme['topPageId'] = $result1;
                    $result2 = Db::name('theme')->update($theme);
                    if ($result2) {
                        saveLog(Config::get('event')['edit'], 'theme', $theme);
                    }
                    $page['themeName'] = $theme['themeName'];
                    $this->assign('item', $page);
                    return $this->fetch();
                } else {
                    echo retJsonMsg('add failed', -1, $result1);
                }
            } else {
                $item = Db::name('page')->where('pageId', $theme['topPageId'])->where('status', 2)->find();
                $item['themeName'] = $theme['themeName'];
                $this->assign('item', $item);
                return $this->fetch();
            }
        } else {
            echo retJsonMsg('param error', -1);
        }
    }
}
