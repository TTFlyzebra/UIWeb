<?php

namespace app\flyuiapi\controller;

use think\Db;
use think\Request;

class Cellpagecell extends BaseRestful
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isPost()) {
            if ($request->has('pageId', 'post') && $request->has('jsondata', 'post')) {
                $pageId = (int)$_POST['pageId'];
                $jsondata = $_POST['jsondata'];
                $db = Db::name("cellpagecell");
                $db->where('pageId', $pageId)->delete();
                $topcells = json_decode($jsondata, true);
                $count = count($topcells);
                for ($i = 0; $i < $count; $i++) {
                    $topcell['cellId'] = $topcells[$i]['cellId'];
                    $topcell['x'] = (int)$topcells[$i]['x'];
                    $topcell['y'] = (int)$topcells[$i]['y'];
                    $topcell['width'] = (int)$topcells[$i]['width'];
                    $topcell['height'] = (int)$topcells[$i]['height'];
                    $topcell['pageId'] = $pageId;
                    $db->insert($topcell);
                }
                echo retJsonMsg();
            } else {
                echo retJsonMsg("error!", -1);
            }
        } elseif ($request->isGet()) {
            if ($request->has('pageId', 'get')) {
                $pagedata = getAllPagecell((int)$_GET['pageId'],'cellpagecell');
                for ($pi = 0; $pi < sizeof($pagedata); $pi++) {
                    $pagedata[$pi] = replaceJsonCell($pagedata[$pi]);
                }
                echo retJsonMsg("success!", 0, $pagedata);
            } else {
                echo retJsonMsg("error!", -1);
            }
        }
    }

}
