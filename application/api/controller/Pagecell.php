<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class Pagecell
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
                    $pagedata[$pi] = $this->completeCell($pagedata[$pi]);
                }
                echo retJsonMsg("success!", 0, $pagedata);
            } else {
                echo retJsonMsg("error!", -1);
            }
        }
    }

    public function completeCell($cell)
    {
        $cell['texts'] = json_decode($cell['texts']);
        $cell['images'] = json_decode($cell['images']);
        $cell['pages'] = json_decode($cell['pages']);
        $subfield = getSubCellFiled();
        $db = Db::name('subcell');
        $db->alias('a');
        $db->join("fly_celltype b", "a.celltypeId=b.celltypeId", 'INNER');
        $db->join("fly_theme c", "a.themeId=c.themeId", 'INNER');
        $db->field($subfield);
        $subcells = $db->where('cellId', $cell['cellId'])->select();
        if ($subcells) {
            for ($i = 0; $i < sizeof($subcells); $i++) {
                $subcells[$i]['texts'] = json_decode($subcells[$i]['texts']);
                $subcells[$i]['images'] = json_decode($subcells[$i]['images']);
                $subcells[$i]['pages'] = json_decode($subcells[$i]['pages']);
            }
            $cell['subCells'] = $subcells;
        }
        return $cell;
    }

}
