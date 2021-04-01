<?php

namespace app\flyuiapi\controller;

use think\Db;
use think\Request;

class Pagecell extends BaseRestful
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isPost()) {
            if ($request->has('pageId', 'post') && $request->has('jsondata', 'post')) {
                $pageId = (int)$_POST['pageId'];
                $jsondata = $_POST['jsondata'];
                $db = Db::name("pagecell");
                $db->where('pageId', $pageId)->delete();
                $pagecells = json_decode($jsondata, true);
                $count = count($pagecells);
                for ($i = 0; $i < $count; $i++) {
                    $pagecell['cellId'] = $pagecells[$i]['cellId'];
                    $pagecell['x'] = (int)$pagecells[$i]['x'];
                    $pagecell['y'] = (int)$pagecells[$i]['y'];
                    $pagecell['width'] = (int)$pagecells[$i]['width'];
                    $pagecell['height'] = (int)$pagecells[$i]['height'];
                    $pagecell['pageId'] = $pageId;
                    $db->insert($pagecell);
                }
                echo retJsonMsg();
            } else {
                echo retJsonMsg("error!", -1);
            }
        } elseif ($request->isGet()) {
            if ($request->has('pageId', 'get')) {
                $pagedata = getAllPagecell((int)$_GET['pageId']);
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
