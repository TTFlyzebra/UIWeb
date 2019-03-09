<?php

namespace app\api\controller;

use think\Db;
use think\Request;
use think\Session;

class History
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isDelete()) {
            $delhistory = $request->delete();
            $result = Db::name("history")->where('historyId', $delhistory['historyId'])->delete();
        } elseif ($request->isPut()) {
            $history = $request->put();
            $history['ip'] = request()->ip();
            $history['userid'] = Session::get('userid');
            $result = Db::name("history")->update($history);
        } elseif ($request->isPost()) {
            $history = $request->post();;
            $history['ip'] = request()->ip();
            $history['userid'] = Session::get('userid');
            $result = Db::name("history")->insert($history);
        } elseif ($request->isGet()) {
            $db = Db::name("history");
            if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
                $db->limit($_GET['offset'], $_GET['limit']);
            }
            $db->field('userid,ip', true);
            $historys = $db->select();
            if ($request->isAjax()) {
                $resultdata['total'] = $db->count();
                $resultdata['rows'] = $historys;
                echo json_encode($resultdata);
            } else {
                echo json_encode($historys);
            }
        }
    }

}
