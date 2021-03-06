<?php

namespace app\flyui\controller;

use app\auth\controller\Auth;
use think\Db;
use think\Request;

class Celltype extends Auth
{
    public function index()
    {
        return $this->fetch();
    }

    public function edit()
    {
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $db = Db::name('celltype');
            $item = $db->where('celltypeId', $_GET['id'])->find();
        }
        if (empty($item)) {
            $item = [
                'celltypeId' => -1,
                "celltypeName" => "",
                "celltype" => "",
                "imageurl" => "",
                "html" => "",
                "description" => ""
            ];
        }
        $this->assign('item', $item);
        return $this->fetch();
    }
}
