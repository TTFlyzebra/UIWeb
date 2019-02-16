<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class Celltype
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isDelete()) {
            $delcelltypeId = ($request->only('celltypeId'))['celltypeId'];
            $result = Db::name("celltype")->where('celltypeId', $delcelltypeId)->delete();
        } elseif ($request->isPut()) {
            $cell = $request->put();
            $cell['ip'] = request()->ip();
            $cell['userid'] = (int)$cell['userid'];
            $cell['celltype'] = (int)$cell['celltype'];
            $result = Db::name("celltype")->update($cell);
        } elseif ($request->isPost()) {
            $cell = $_POST;
            $cell['ip'] = request()->ip();
            $cell['userid'] = (int)$_POST['userid'];
            $cell['celltype'] = (int)$_POST['celltype'];
            $result = Db::name("celltype")->insert($cell);
        } elseif ($request->isGet()) {
            $db = Db::name("celltype");
            $db->order('celltype desc');
            if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
                $db->limit($_GET['offset'], $_GET['limit']);
            }
            $db->field('userid,ip', true);
            $celltypes = $db->select();
            if ($request->isAjax()) {
                $resultdata['total'] = $db->count();
                $resultdata['rows'] = $celltypes;
                echo json_encode($resultdata);
            } else {
                echo json_encode($celltypes);
            }
        }
    }

}
