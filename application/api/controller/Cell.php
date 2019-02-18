<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class Cell
{
    public function index()
    {
        $request = Request::instance();

        if($request->isDelete()){
            $delcellId = ($request->only('cellId'))['cellId'];
            $db =  Db::name("cell");
            $result = $db->where('cellId',$delcellId)->delete();
        } elseif ($request->isPut()) {
            $cell = $request->put();
            $cell['celltypeId'] =(int)$cell['celltypeId'];
            $cell['width'] = (int)$cell['width'];
            $cell['height'] = (int)$cell['height'];
            $cell['textSize'] = (int)$cell['textSize'];
            $cell['textLeft'] = (int)$cell['textLeft'];
            $cell['textRight'] = (int)$cell['textRight'];
            $cell['textTop'] = (int)$cell['textTop'];
            $cell['textBottom'] = (int)$cell['textBottom'];
            $cell['userid'] = (int)$cell['userid'];
            $cell['ip'] = request()->ip();
            $db =  Db::name("cell");
            $result = $db->update($cell);
        }elseif ($request->isPost()) {
            $cell = $request->post();
            $cell['celltypeId'] =(int)$cell['celltypeId'];
            $cell['width'] = (int)$cell['width'];
            $cell['height'] = (int)$cell['height'];
            $cell['textSize'] = (int)$cell['textSize'];
            $cell['textLeft'] = (int)$cell['textLeft'];
            $cell['textRight'] = (int)$cell['textRight'];
            $cell['textTop'] = (int)$cell['textTop'];
            $cell['textBottom'] = (int)$cell['textBottom'];
            $cell['userid'] = (int)$cell['userid'];
            $cell['ip'] = request()->ip();
            $db =  Db::name("cell");
            $result = $db->insert($cell);

        } elseif ($request->isGet()) {
            $db = Db::name("cell");
            $db->order('cellId desc');
            if($request->has('limit','get')&&$request->has('offset','get')){
                $db->limit($_GET['offset'],$_GET['limit']);
            }
//            $db->field('userid,ip',true);

            $cells = $db
                ->alias('a')
                ->join("fly_celltype b", "a.celltypeId=b.celltypeId")
//                ->field('a.userid,a.ip,b.userid,b.ip',true)
                ->select();
            if($request->isAjax()){
                $resultdata['total'] = $db->count();
                $resultdata['rows'] = $cells;
                echo json_encode($resultdata);
            }else{
                echo json_encode($cells);
            }

        }
    }

}
