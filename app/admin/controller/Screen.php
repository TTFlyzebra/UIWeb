<?php

namespace app\admin\controller;

use think\Controller;
use think\Db;
use think\Request;

class Screen extends Controller
{
    public function index()
    {
        $db= Db::name('table');
        $tables = $db->select();
        $this->assign('list',$tables);

        $request = Request::instance();
        if($request->has('tableId','get')) {
            $this->assign('tableId', (int)$_GET['tableId']);
        }else{
            $this->assign('tableId', -1);
        }
        return $this->fetch();
    }
}
