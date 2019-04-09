<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class App
{
    public function index()
    {
        $request = Request::instance();

        $themeName = "Test-AP1";

        if ($request->has('appname', 'get')) {
            $themeName = $request->param('appname');
        }
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
            $cellList = getPagecell($theme['topPageId']);
            for ($n = 0; $n < sizeof($cellList); $n++) {
                $cellList[$n]['textTitle'] = array(
                    'zh' => $cellList[$n]['textTitle']
                );
                $subCells = Db::name('cellsub')
                    ->where('cellId', $cellList[$n]['cellId'])
                    ->where('status', 1)
                    ->field(["cellId", "celltypeId", "mLeft" => "x", "mTop" => "y", "width", "height",
                        "imageurl1", "imageurl2", "backcolor", "textTitle", "textSize", "textColor",
                        "gravity", "textFont", "sendAction", "recvAction","clickevent", "remark", "extend"])
                    ->select();
                for ($t = 0; $t < sizeof($subCells); $t++) {
                    $subCells[$t]['textTitle'] = array(
                        'zh' => $subCells[$t]['textTitle']
                    );
                }
                $cellList[$n]['subCells'] = $subCells;
            }
            $result['topPage']['pageId'] = $theme['topPageId'];
            $result['topPage']['cellList'] = $cellList;
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
            for ($j = 0; $j < sizeof($cellList); $j++) {
                $cellList[$j]['textTitle'] = array(
                    'zh' => $cellList[$j]['textTitle']
                );
                $subCells = Db::name('cellsub')
                    ->where('cellId', $cellList[$j]['cellId'])
                    ->where('status', 1)
                    ->field(["cellId", "celltypeId", "mLeft" => "x", "mTop" => "y", "width", "height",
                        "imageurl1", "imageurl2", "backcolor", "textTitle", "textSize", "textColor",
                        "gravity", "textFont", "sendAction", "recvAction","clickevent", "remark", "extend"])
                    ->select();
                for ($t = 0; $t < sizeof($subCells); $t++) {
                    $subCells[$t]['textTitle'] = array(
                        'zh' => $subCells[$t]['textTitle']
                    );
                }
                $cellList[$j]['subCells'] = $subCells;
            }
            $pageList[$i]['cellList'] = $cellList;
        }
        $result['pageList'] = $pageList;
        echo json_encode($result);

    }

}
