<?php

namespace app\flyuiapi\controller;

use think\Db;
use think\Request;

class Themepage extends BaseRestful
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isPost()) {
            if ($request->has('themeId', 'post') && $request->has('jsondata', 'post')) {
                $themeId = (int)$_POST['themeId'];
                $jsondata = $_POST['jsondata'];
                $db = Db::name("themepage");
                $db->where('themeId', $themeId)->delete();
                $themepages = json_decode($jsondata, true);
                $count = count($themepages);
                for ($i = 0; $i < $count; $i++) {
                    $themepage['pageId'] = $themepages[$i]['pageId'];
                    $themepage['themeId'] = $themeId;
                    $db->insert($themepage);
                }
            } else {
                echo "error thinkPHP";
            }
        } elseif ($request->isGet()) {
            if ($request->has('themeId', 'get')) {
                $pagedatas = Db::name('themepage')
                    ->where('themeId', (int)$_GET['themeId'])
                    ->alias('a')
                    ->join("fly_page b", "a.pageId=b.pageId")
                    ->field('b.pageId,b.pageName,width,height')
                    ->select();
                if($request->isAjax()) {
                    $result['pagelist'] = $pagedatas;
                    $result['msg'] = '成功';
                    $result['ret'] = 0;
                    echo json_encode($result);
                }else{
                    echo json_encode($pagedatas);
                }
            }
        }
    }

}
