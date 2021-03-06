<?php

namespace app\index\controller;

use think\Controller;
use think\Db;
use think\Request;

class News extends Controller
{
    public function index()
    {
        $request = Request::instance();
        $db = Db::name('news');
        $page = array();
        $page['limit'] = 10;
        $page['curr'] = 1;
        $page['count'] = $db->count();
        if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
            $page['curr'] = $_GET['offset'];
            $page['limit'] = $_GET['limit'];
        }
        $db->order('createtime desc');
        $db->limit(($page['curr'] - 1) * $page['limit'], $page['limit']);
        $newss = $db->where('status', 1)->select();

        for ($i = 0; $i < sizeof($newss); $i++) {
            $newss[$i]['newsText'] = mb_substr($newss[$i]['newsText'], 0, 72) . "......";
        }

        $this->assign('list1', $newss);
        $this->assign('page', $page);
        return $this->fetch();
    }

    public function detail()
    {
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $db = Db::name('news');
            $item = $db->where('newsId', $_GET['id'])->where('status', 1)->find();
            if(!empty($item)) {
                $item['newsText'] = preg_replace("/\r/\n", "<br/>", $item['newsText']);
                $item['remark'] = preg_replace("/\r/\n", "<br/>", $item['remark']);
                $this->assign('item', $item);
            }else{
                $this->assign('item', null);
            }
        }
        return $this->fetch();
    }
}
