<?php

namespace app\api\controller;

use think\Config;
use think\Db;
use think\Request;

class Cellpro extends BaseRestful
{
    public function index()
    {
        $tableName = 'cellpro';
        $order = 'uptime desc';
        $joins = [
            [
                "fly_celltype b",
                "a.celltypeId=b.celltypeId",
                'INNER'
            ],
            [
                "fly_theme c",
                "a.themeId=c.themeId",
                'INNER'
            ]
        ];
        $field = ['a.cellId', 'a.description','a.themeId','a.celltypeId', 'c.themeName', 'a.resId', 'a.width', 'a.height', 'a.backColor', 'a.filterColor',
            'a.recv', 'a.send', 'a.texts', 'a.images', 'a.pages', 'a.remark', 'a.uptime', 'b.celltype',
            'b.celltypeName', 'b.imageurl' => 'typeimageurl'];
        $request = Request::instance();
        if ($request->isPost()) {
            $table = $request->post();
            $cell = getCell($table);
            $result = Db::name($tableName)->insert($cell, false, true);
            if ($result) {
                //添加子组件
                if ($request->has('subcell')) {
                    $subs = $table['subcell'];
                    for ($i = 1; $i < sizeof($subs); $i++) {
                        $subcell = getCell($table, $subs[$i]);
                        $subcell['cellId'] = $result;
                        $subcells[] = $subcell;
                    }
                    Db::name('cellsub')->insertAll($subcells);
                }
                echo retJsonMsg();
                $table['cellId'] = $result;
                saveLog(Config::get('event')['add'], $tableName, $cell);
            } else {
                echo retJsonMsg('add failed', -1, $result);
            }
        } elseif ($request->isGet()) {
            $db = Db::name($tableName);
            if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
                $db->limit($_GET['offset'], $_GET['limit']);
            }
            if (!empty($order)) {
                $db->order($order);
            }
            if (!empty($joins)) {
                $db->alias('a');
                foreach ($joins as $v) {
                    $db->join($v[0], $v[1], $v[2]);
                }
            }
            if (empty($field)) {
                $db->field('userid,ip', true);
            } else {
                $db->field($field);
            }
            $db->where('a.status', 1);
            if ($request->has('id', 'get')) {
                $cell = $db->where('cellId', $_GET['id'])->find();
                if($cell){
                    $cell['texts'] = json_decode($cell['texts']);
                    $cell['images'] = json_decode($cell['images']);
                    $cell['pages'] = json_decode($cell['pages']);
                    echo retJsonMsg("find ok!",0,$cell);
                }else{
                    echo retJsonMsg('find failed!', -1);
                }
            } else {
                $cells = $db->select();
                for ($i = 0; $i < sizeof($cells); $i++) {
                    $cells[$i]['texts'] = json_decode($cells[$i]['texts']);
                    $cells[$i]['images'] = json_decode($cells[$i]['images']);
                    $cells[$i]['pages'] = json_decode($cells[$i]['pages']);
                }
                if($cells) {
                    if ($request->isAjax()&&$request->has('limit', 'get') && $request->has('offset', 'get')) {
                        $resultdata['total'] = $db->where('status', 1)->count();
                        $resultdata['rows'] = $cells;
                        $resultdata['msg'] = "success!";
                        $resultdata['code'] = 0;
                        echo json_encode($resultdata);
                    } else {
                        echo retJsonMsg("list ok",0,json_encode($cells));
                    }
                }else{
                    echo retJsonMsg('error!', -1,$cells);
                }
            }

        }

    }
}
