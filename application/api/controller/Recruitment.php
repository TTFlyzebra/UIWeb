<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class Recruitment
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isDelete()) {
            $delrecruitmentId = ($request->only('recruitmentId'))['recruitmentId'];
            $result = Db::name("recruitment")->where('recruitmentId', $delrecruitmentId)->delete();
        } elseif ($request->isPut()) {
            $recruitment = $request->put();
            $recruitment['ip'] = request()->ip();
            $result = Db::name("recruitment")->update($recruitment);
        } elseif ($request->isPost()) {
            $recruitment = $request->post();;
            $recruitment['ip'] = request()->ip();
            $result = Db::name("recruitment")->insert($recruitment);
        } elseif ($request->isGet()) {
            $db = Db::name("recruitment");
            if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
                $db->limit($_GET['offset'], $_GET['limit']);
            }
            $db->field('userid,ip', true);
            $recruitments = $db->select();
            if ($request->isAjax()) {
                $resultdata['total'] = $db->count();
                $resultdata['rows'] = $recruitments;
                echo json_encode($resultdata);
            } else {
                echo json_encode($recruitments);
            }
        }
    }

}
