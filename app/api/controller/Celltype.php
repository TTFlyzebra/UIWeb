<?php

namespace app\api\controller;

use think\Controller;
use think\Db;

class Celltype extends Controller
{
    public function index()
    {
        $data = $_POST;
        $data['ip'] = request()->ip();
        $data['userid'] = (int)$_POST['userid'];
        Db::name("celltype")->insert($data);
    }

    public function show(){
        $celltypes = Db::name("celltype")->select();
        echo json_encode($celltypes);
    }
}
