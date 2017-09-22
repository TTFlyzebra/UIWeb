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
        dump($_POST);
        dump($data);
        Db::name("celltype")->insert($data);
    }
}
