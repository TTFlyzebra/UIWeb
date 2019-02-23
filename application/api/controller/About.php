<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class About
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isDelete()) {
            $delaboutId = ($request->only('aboutId'))['aboutId'];
            $result = Db::name("about")->where('aboutId', $delaboutId)->delete();
        } elseif ($request->isPut()) {
            $about = $request->put();
            $about['ip'] = request()->ip();
            $result = Db::name("about")->update($about);
        } elseif ($request->isPost()) {
            $about = $request->post();;
            $about['ip'] = request()->ip();
            $result = Db::name("about")->insert($about);
        } elseif ($request->isGet()) {
            $db = Db::name("about");
            if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
                $db->limit($_GET['offset'], $_GET['limit']);
            }
            $db->field('userid,ip', true);
            $abouts = $db->select();
            if ($request->isAjax()) {
                $resultdata['total'] = $db->count();
                $resultdata['rows'] = $abouts;
                echo json_encode($resultdata);
            } else {
                echo json_encode($abouts);
            }
        }
    }

}
