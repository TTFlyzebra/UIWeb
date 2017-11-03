<?php

namespace app\api\controller;

use think\Db;
use think\Request;

class Tablecell
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isPost()) {
            if ($request->has('tableId', 'post') && $request->has('jsondata', 'post')) {
                $tableId = (int)$_POST['tableId'];
                $jsondata = $_POST['jsondata'];
                $db = Db::name("tablecell");
                $db->where('tableId', $tableId)->delete();
                $tablecells = json_decode($jsondata, true);
                $count = count($tablecells);
                for ($i = 0; $i < $count; $i++) {
                    $tablecell['cellId'] = $tablecells[$i]['cellId'];
                    $tablecell['x'] = (int)$tablecells[$i]['x'];
                    $tablecell['y'] = (int)$tablecells[$i]['y'];
                    $tablecell['width'] = (int)$tablecells[$i]['width'];
                    $tablecell['height'] = (int)$tablecells[$i]['height'];
                    $tablecell['tableId'] = $tableId;
                    $db->insert($tablecell);
                }
            } else {
                echo "error thinkPhp";
            }
        } elseif ($request->isGet()) {
            if ($request->has('tableId', 'get')) {
                $tabledata = Db::name('tablecell')
                    ->where('tableId', (int)$_GET['tableId'])
                    ->alias('a')
                    ->join("fly_cell b", "a.cellId=b.cellId")
                    ->select();
                $result['cellList'] = $tabledata;
                $result['msg'] = '成功';
                $result['ret'] = 0;
                echo json_encode($result);
            }
        }
    }

}
