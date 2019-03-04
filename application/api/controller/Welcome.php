<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class Welcome
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isDelete()) {
            $delwelcome = $request->only('welcomeId');
            $result = Db::name("welcome")->where('welcomeId', $delwelcome['welcomeId'])->delete();
        } elseif ($request->isPut()) {
            $welcome = $request->put();
            $welcome['ip'] = request()->ip();
            $result = Db::name("welcome")->update($welcome);
        } elseif ($request->isPost()) {
            $welcome = $request->post();;
            $welcome['ip'] = request()->ip();
            $result = Db::name("welcome")->insert($welcome);
        } elseif ($request->isGet()) {
            $db = Db::name("welcome");
            $db->order('welcomeSort asc');
            if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
                $db->limit($_GET['offset'], $_GET['limit']);
            }
            $db->field('userid,ip', true);
            $welcomes = $db->select();
            if ($request->isAjax()) {
                $resultdata['total'] = $db->count();
                $resultdata['rows'] = $welcomes;
                echo json_encode($resultdata);
            } else {
                echo json_encode($welcomes);
            }
        }
    }

}
