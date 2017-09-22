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
            $sumitem = $db->count();
            $cell['celltype'] = $sumitem+1;
            $result = $db->insert($cell);
            if($result>0){
                $this->success("success");
            }else{
                $this->error("error");
            }
        } elseif ($request->isGet()) {
            $db = Db::name("celltype");
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
