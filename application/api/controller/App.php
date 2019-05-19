<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class App
{
    public function index()
    {
        $request = Request::instance();

        if ($request->has('type', 'get')) {
            switch ($request->param('type')) {
                case "music":
                    $themeName = "Music-AP1";
                    break;
                case "video":
                    $themeName = "Video-AP1";
                    break;
                case "photo":
                    $themeName = "Photo-AP1";
                    break;
                default:
                    $themeName = "Launcher-AP1";
                    break;
            }
        } else {
            $themeName = "Launcher-AP1";
        }
        if ($request->has('appname', 'get')) {
            $themeName = $request->param('appname');
        }

        $themeName = "Launcher-AP1";

        $theme = Db::name('theme')
            ->where('themeName', $themeName)
            ->field('edittime,status,userid,ip', true)
            ->find();
        if (!$theme) {
            echo retJsonMsg("无模板数据", -1);
            return;
        }
        $result = $theme;
        unset($result['topPageId']);
        //获取topPage
        if (!empty($theme['topPageId'])) {
            $result['topPage'] = getPageBean($theme['topPageId']);
        }
        //获取pageList
        $pageList = Db::name('themepage')
            ->where('themeId', $theme['themeId'])
            ->alias('a')
            ->join("fly_page b", "a.pageId=b.pageId")
            ->field('b.pageId,b.pageName,width,height')
            ->select();
        //获取cellList
        for ($i = 0; $i < sizeof($pageList); $i++) {
            $cellList = getPagecell($pageList[$i]['pageId']);
            $pageList[$i]['cellList'] = $cellList;
        }
        $result['pageList'] = $pageList;
        echo json_encode($result);

    }

}
