<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class Theme
{
    public function index()
    {
        $request = Request::instance();
        if($request->isDelete()){
            $delthemeId = ($request->only('themeId'))['themeId'];
            $db =  Db::name("theme");
            $result = $db->where('themeId',$delthemeId)->delete();
        }elseif ($request->isPut()) {
            $theme = $request->put();
            $theme['ip'] = request()->ip();
            $theme['userid'] = (int)$theme['userid'];
            $db =  Db::name("theme");
            $result = $db->update($theme);
        }elseif ($request->isPost()) {
            $theme =  $request->post();
            $theme['ip'] = request()->ip();
            $theme['userid'] = (int)$theme['userid'];
            $db =  Db::name("theme");
            $result = $db->insert($theme);
        } elseif ($request->isGet()) {
            $db = Db::name("theme");
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
