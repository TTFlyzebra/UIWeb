<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class App
{
    public function index()
    {
        $request = Request::instance();
        if ($request->has('appname', 'get')) {
            $theme = Db::name('theme')
                ->where('themeName', $_GET['appname'])
                ->field('edittime,userid,ip', true)
                ->find();
            if (!$theme) {
                echo retmsg("无模板数据", -1);
                return;
            }
//            $result['width'] = $theme['width'];
//            $result['height'] = $theme['height'];
//            $result['isMirror'] = $theme['isMirror'];
//            $result['animType'] = $theme['animType'];
//            $result['imageurl'] = $theme['imageurl'];
            $result = $theme;

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
                        'zh'=>$cellList[$j]['textTitle']
                    );
                }
                $pageList[$i]['cellList'] = $cellList;
            }
            $result['pageList'] = $pageList;
            echo json_encode($result);
        }

    }

}
