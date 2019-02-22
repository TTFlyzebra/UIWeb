<?php

namespace app\index\controller;

use think\Controller;
use think\Db;
use think\Request;

class Cases extends Controller {
	public function index() {
        $request = Request::instance();
        $db = Db::name('cases');
        $page = array();
        $page['limit'] = 6;
        $page['curr'] = 1;
        $page['count'] = $db->count();
        if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
            $page['curr'] = $_GET['offset'];
            $page['limit'] = $_GET['limit'];
        }
        $db->order('createtime desc');
        $db->limit(($page['curr'] - 1) * $page['limit'], $page['limit']);
        $casess = $db->select();

//        for ($i = 0; $i < sizeof($casess); $i++) {
//            $casess[$i]['casesText'] = mb_substr($casess[$i]['casesText'], 0, 72) . "......";
//        }

        $this->assign('list1', $casess);
        $this->assign('page', $page);
        return $this->fetch();
	}
}
