<?php

namespace app\api\controller;

use think\Request;

class Test
{
    public function index()
    {
        $request = Request::instance();
        dump($request->param());
        if ($request->isPost()) {
            $table = $request->post();
            $cell = getCell($table);
            dump($cell);
//            $result = Db::name("cellPro")->insert($cell, false, true);
//            if ($result) {
//                //添加子组件
//                if ($request->has('subcell')) {
//                    $subs = $table['subcell'];
//                    for ($i = 1; $i < sizeof($subs); $i++) {
//                        $subcell = $this->getCell($table, $subs[$i]);
//                        $subcell['cellId'] = $result;
//                        $subcells[] = $subcell;
//                    }
//                    Db::name('cellsub')->insertAll($subcells);
//                }
//                echo retJsonMsg();
//                $table["cellId"] = $result;
//                saveLog(Config::get('event')['add'], "cellPro", $cell);
//            } else {
//                echo retJsonMsg('add failed', -1, $result);
//            }
        }
    }

}
