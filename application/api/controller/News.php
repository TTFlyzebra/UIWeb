<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class News
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isDelete()) {
            $delnews = $request->only('newsId');
            $result = Db::name("news")->where('newsId', $delnews['newsId'])->delete();
        } elseif ($request->isPut()) {
            $news = $request->put();
            $news['ip'] = request()->ip();
            $result = Db::name("news")->update($news);
        } elseif ($request->isPost()) {
            $news = $request->post();;
            $news['ip'] = request()->ip();
            $result = Db::name("news")->insert($news);
        } elseif ($request->isGet()) {
            $db = Db::name("news");
            $db->order('createtime desc');
            if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
                $db->limit($_GET['offset'], $_GET['limit']);
            }
            $db->field('userid,ip', true);
            $newss = $db->select();
            if ($request->isAjax()) {
                $resultdata['total'] = $db->count();
                $resultdata['rows'] = $newss;
                echo json_encode($resultdata);
            } else {
                echo json_encode($newss);
            }
        }
    }

}
