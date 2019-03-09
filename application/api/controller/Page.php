<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class Page
{
    public function index()
    {
        $request = Request::instance();
        if($request->isDelete()){
            $delpage = $request->delete();
            $db =  Db::name("page");
            $result = $db->where('pageId',$delpage['pageId'])->delete();
        }elseif ($request->isPut()) {
            $page = $request->put();
            $page['ip'] = request()->ip();
            $page['userid'] = Session::get('userid');
            $db =  Db::name("page");
            $result = $db->update($page);
        }elseif ($request->isPost()) {
            $page =  $request->post();
            $page['ip'] = request()->ip();
            $page['userid'] = Session::get('userid');
            $db =  Db::name("page");
            $result = $db->insert($page);
        } elseif ($request->isGet()) {
            $db = Db::name("page");
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
