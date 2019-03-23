<?php

namespace app\api\controller;

use think\Db;
use think\Exception;

class Theme extends BaseRestful
{
    public function index()
    {
        if (request()->isGet()) {
            try {
                $db = Db::name("theme");
                if (request()->has('limit', 'get') && request()->has('offset', 'get')) {
                    $db->limit($_GET['offset'], $_GET['limit']);
                }
//                $db->alias("a")
//                    ->join("fly_page b", "a.topPageId=b.pageId", 'LEFT')
//                    ->field(['a.themeId', "a.themeName", "a.themeType", "a.screenWidth", "a.screenHeight",
//                        "a.x", "a.y", "a.width", "a.height", "a.imageurl", "a.isMirror",
//                        "a.animType", "a.remark", "a.topPageId" => "pageId", "b.pageName"]);
                $celltypes = $db->select();
                for ($i = 0; $i < sizeof($celltypes); $i++) {
                    $pagedatas = Db::name('themepage')
                        ->where('themeId', $celltypes[$i]['themeId'])
                        ->alias('a')
                        ->join("fly_page b", "a.pageId=b.pageId")
                        ->field('a.pageId,b.pageName')
                        ->select();
                    $str = '';
                    foreach ($pagedatas as $v) {
                        $str .= $v['pageName'] . '[' . $v['pageId'] . '];';//拼接起来
                    }
                    $celltypes[$i]['themePages'] = $str;
                    unset($themePages);
                }

                if (request()->isAjax()) {
                    $resultdata['total'] = $db->count();
                    $resultdata['rows'] = $celltypes;
                    echo json_encode($resultdata);
                } else {
                    echo json_encode($celltypes);
                }
            } catch (Exception $e) {
                echo retJsonMsg("exception", -1, $e);
            }
        } else {
            $this->handle('theme');
        }
    }

}
