<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class Table
{
    public function index()
    {
        $request = Request::instance();
        if($request->isDelete()){
            $deltableId = ($request->only('tableId'))['tableId'];
            $db =  Db::name("table");
            $result = $db->where('tableId',$deltableId)->delete();
        }elseif ($request->isPost()) {
            $cell = $_POST;
            $cell['ip'] = request()->ip();
            $cell['userid'] = (int)$_POST['userid'];
            $db =  Db::name("table");
            $result = $db->insert($cell);
        } elseif ($request->isGet()) {
            $db = Db::name("table");
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
