<?php

namespace app\home\controller;

use app\auth\controller\Auth;
use think\Db;
use think\Request;

class Cases extends Auth
{
    public function index()
    {
        return $this->fetch();
    }

    public function add()
    {
        return $this->fetch();
    }

    public function edit()
    {
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $db = Db::name('cases');
            $item = $db->where('casesId', $_GET['id'])->find();
            $this->assign('item', $item);
            return $this->fetch();
        }
    }
}
