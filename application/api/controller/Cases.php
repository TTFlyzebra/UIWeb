<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class Cases
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isDelete()) {
            $delcases = $request->only('casesId');
            $result = Db::name("cases")->where('casesId', $delcases['casesId'])->delete();
        } elseif ($request->isPut()) {
            $cases = $request->put();
            $cases['ip'] = request()->ip();
            $result = Db::name("cases")->update($cases);
        } elseif ($request->isPost()) {
            $cases = $request->post();;
            $cases['ip'] = request()->ip();
            $result = Db::name("cases")->insert($cases);
        } elseif ($request->isGet()) {
            $db = Db::name("cases");
            $db->order('createtime desc');
            if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
                $db->limit($_GET['offset'], $_GET['limit']);
            }
            $db->field('userid,ip', true);
            $casess = $db->select();
            if ($request->isAjax()) {
                $resultdata['total'] = $db->count();
                $resultdata['rows'] = $casess;
                echo json_encode($resultdata);
            } else {
                echo json_encode($casess);
            }
        }
    }

}
