<?php

namespace app\auth\controller;

use gmars\rbac\Rbac;
use think\Db;
use think\Request;

class Permission extends Auth
{
    public function index()
    {
        echo "功能开发中......";
//        $rbacObj = new Rbac();
//        $data = [
//            'name' => '商品列表',
//            'status' => 1,
//            'description' => '查看商品的所有列表',
//            'path' => '/index/goods/list',
//            'create_time' => time()
//        ];
//        $rbacObj->createPermission($data);
//        return $this->fetch();
    }

    public function add()
    {
        return $this->fetch();
    }

    public function edit()
    {
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $db = Db::name('about');
            $item = $db->where('aboutId', $_GET['id'])->find();
            $this->assign('item', $item);
            return $this->fetch();
        }
    }
}
