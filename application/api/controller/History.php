<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class History
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isDelete()) {
            $delhistory = $request->only('historyId');
            $result = Db::name("history")->where('historyId', $delhistory['historyId'])->delete();
        } elseif ($request->isPut()) {
            $history = $request->put();
            $history['ip'] = request()->ip();
            $result = Db::name("history")->update($history);
        } elseif ($request->isPost()) {
            $history = $request->post();;
            $history['ip'] = request()->ip();
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
