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
            } else {
                echo "error thinkPHP";
            }
        } elseif ($request->isGet()) {
            if ($request->has('pageId', 'get')) {
                $pagedata = Db::name('pagecell')
                    ->where('pageId', (int)$_GET['pageId'])
                    ->alias('a')
                    ->join("fly_cell b", "a.cellId=b.cellId")
                    ->join("fly_celltype c", "b.celltypeId=c.celltypeId")
                    ->field('a.cellId,x,y,a.width,a.height,celltype,
                    themeName,imageurl1,imageurl2,textTitle,textSize,textColor,textAlign,
                    textFont,textTop,textBottom,textLeft,textRight,packName,className,
                    action,flyAction,intentFlag,b.extend,b.remark')
                    ->select();
                $result['cellList'] = $pagedata;
                $result['msg'] = '成功';
                $result['ret'] = 0;
                echo json_encode($result);
            }
        }
    }

}
