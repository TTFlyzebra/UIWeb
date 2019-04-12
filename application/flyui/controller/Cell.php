<?php

namespace app\flyui\controller;

use app\auth\controller\Auth;
use think\Config;
use think\Db;
use think\Request;
use think\Session;

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
        $this->assign('gravitys', getGravity());
        return $this->fetch();
    }

    public function edit()
    {
        $this->assign('list1', Db::name('celltype')->select());
        $this->assign('actions', getAction());
        $this->assign('gravitys', getGravity());
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

    public function subpage()
    {
        $db = Db::name('page');
        $pages = $db->where('status', 3)->select();
        $this->assign('list', $pages);
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $cell = Db::name('cell')
                ->where('cellId', $_GET['id'])
                ->field('userid,ip,edittime', true)
                ->find();
            if (empty($cell['cellpageId'])) {
                $page = [];
                $page['pageName'] = 'CELL_PAGE';
                $page['status'] = 3;
                $page['width'] = $cell['width'];
                $page['height'] = $cell['height'];
                $page['userid'] = Session::get('userid');
                $page['ip'] = $request->ip();
                $result1 = Db::name('page')->insert($page, false, true);
                if ($result1) {
                    $page['pageId'] = $result1;
                    saveLog(Config::get('event')['add'], 'page', $page);
                    $cell['cellpageId'] = $result1;
                    $result2 = Db::name('cell')->update($cell);
                    if ($result2) {
                        saveLog(Config::get('event')['edit'], 'cell', $cell);
                    }
                    $page['themeName'] = "";
                    $this->assign('item', $page);
                    return $this->fetch();
                } else {
                    echo retJsonMsg('add failed', -1, $result1);
                }
            } else {
                $item = Db::name('page')->where('pageId', $cell['cellpageId'])->where('status', 3)->find();
                $item['themeName'] = "";
                $this->assign('item', $item);
                return $this->fetch();
            }
        } else {
            echo retJsonMsg('param error', -1);
        }
    }
}
