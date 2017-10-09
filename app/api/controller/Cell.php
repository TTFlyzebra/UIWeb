<?php

namespace app\api\controller;

use think\Controller;
use think\Db;
use think\Request;

class Cell extends Controller
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isPost()) {
            dump($_POST);
            $cell = $_POST;
            $cell['ip'] = request()->ip();
            if($request->has('userid','post')){
                $cell['userid'] = (int)$_POST['userid'];
            }
            $db =  Db::name("cell");
            $result = $db->insert($cell);
        } elseif ($request->isGet()) {
            $db = Db::name("cell");
            $resultdata['total'] = $db->count();
            $db->order('celltype desc');
            if($request->has('limit','get')&&$request->has('offset','get')){
                $db->limit($_GET['offset'],$_GET['limit']);
            }
            $celltypes = $db->select();
            $resultdata['rows'] = $celltypes;
            echo json_encode($resultdata);
        }
    }

}
