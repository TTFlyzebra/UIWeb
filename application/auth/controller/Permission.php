<?php

namespace app\admin\controller;

use gmars\rbac\Rbac;
use think\Controller;
use think\Db;
use think\Request;

class Permission extends Controller
{
    public function index()
    {
        echo __DIR__;
//        $rbacObj = new Rbac();
//        $data = [
//            'name' => '商品列表',
//            'status' => 1,
//            'description' => '查看商品的所有列表',
//            'path' => '/index/goods/list',
//            'create_time' => time()
//        ];
//        $rbacObj->createPermission($data);
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
            $db = Db::name('about');
            $item = $db->where('aboutId', $_GET['id'])->find();
            $this->assign('item', $item);
            return $this->fetch();
        }
    }
}
