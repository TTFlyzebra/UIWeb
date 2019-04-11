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
            for ($j = 0; $j < sizeof($cellList); $j++) {
                $cellList[$j]['textTitle'] = array(
                    'zh' => $cellList[$j]['textTitle']
                );
                //cellpage
                if (!empty($cellList[$j]['cellpageId'])) {
                    $cellList[$j]['page'] = getPageBean($cellList[$j]['cellpageId']);
                }

                $subCells = Db::name('cellsub')
                    ->alias('a')
                    ->join("fly_celltype b", "a.celltypeId=b.celltypeId")
                    ->where('a.cellId', $cellList[$j]['cellId'])
                    ->where('a.status', 1)
                    ->field(["a.cellId", "a.mLeft" => "x", "a.mTop" => "y", "a.width", "a.height",
                        "a.imageurl1", "a.imageurl2", "a.backcolor", "a.textTitle", "a.textSize", "a.textColor",
                        "a.gravity", "a.textFont", "a.sendAction", "a.recvAction", "a.clickevent", "a.remark", "a.extend","b.celltype"])
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
