<?php

namespace app\api\controller;

use think\Controller;
use think\Db;
use think\Request;

class Celltype extends Controller
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isPost()) {
            $cell = $_POST;
            $cell['ip'] = request()->ip();
            $cell['userid'] = (int)$_POST['userid'];
            $db =  Db::name("celltype");
            $result = $db->insert($cell);
        } elseif ($request->isGet()) {
            $db = Db::name("celltype");
            $db->order('celltype desc');
            if($request->has('limit','get')&&$request->has('offset','get')){
                $db->limit($_GET['offset'],$_GET['limit']);
            }
            $db->field('userid,ip',true);
            $celltypes = $db->select();
            if($request->isAjax()){
                $resultdata['total'] = $db->count();
                $resultdata['rows'] = $celltypes;
                echo json_encode($resultdata);
            }else{
                echo json_encode($celltypes);
            }
        }
    }

}
