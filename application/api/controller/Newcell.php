<?php

namespace app\api\controller;

use think\Config;
use think\Db;
use think\Request;

class Newcell extends BaseRestful
{
    public function index()
    {
        echo __CLASS__;
        $tableName = 'cellPro';
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
        $field = ['a.cellId', 'c.themeName','a.resId','a.width', 'a.height', 'a.backColor', 'a.filterColor',
            'a.recv','a.send', 'a.texts', 'a.images', 'a.pages', 'a.remark', 'a.uptime', 'b.celltype',
            'b.celltypeName','b.imageurl'=>'typeimageurl'];
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
        }

    }
}
