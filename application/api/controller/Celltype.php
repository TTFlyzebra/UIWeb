<?php

namespace app\api\controller;

use think\Db;
use think\Request;
use think\Session;

class Celltype
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isDelete()) {
            $delcelltype = $request->only('celltypeId');
            $result = Db::name("celltype")->where('celltypeId', $delcelltype['celltypeId'])->delete();
        } elseif ($request->isPut()) {
            $celltype = $request->put();
            $celltype['ip'] = request()->ip();
            $celltype['userid'] = Session::get('userid');
            $result = Db::name("celltype")->update($celltype);
        } elseif ($request->isPost()) {
            $celltype = $request->post();;
            $celltype['ip'] = request()->ip();
            $celltype['userid'] = Session::get('userid');
            $result = Db::name("celltype")->insert($celltype);
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
