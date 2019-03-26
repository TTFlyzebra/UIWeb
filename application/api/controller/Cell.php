<?php

namespace app\api\controller;

use think\Config;
use think\Db;
use think\Request;
use think\Session;

class Cell extends BaseRestful
{
    public function index()
    {

//        try {
            $tableName = 'cell';
            $order = 'edittime desc';
            $joins = [
                [
                    "fly_celltype b",
                    "a.celltypeId=b.celltypeId",
                    'INNER'
                ]
            ];
            $field = ['a.cellId', 'a.width', 'a.height', 'a.imageurl1', 'a.imageurl2', 'a.textTitle', 'a.textSize', 'a.textColor',
                'a.textAlign', 'a.textFont', 'a.textLeft', 'a.textTop', 'a.textRight', 'a.launchAction','a.acceptAction',
                'a.textBottom', 'a.event',  'a.status', 'a.remark', 'a.extend', 'a.edittime', 'b.celltype','b.celltypeName'];
            $request = Request::instance();
            if ($request->isPost()) {
                $table = $request->post();
                $cell = $this->getCell($table);
                $result = Db::name($tableName)->insert($cell, false, true);
                if ($result) {
                    //添加子控件
                    if ($request->has('subcell')) {
                        $subs = $table['subcell'];
                        for ($i = 0; $i < sizeof($subs); $i++) {
                            $subcell = $this->getCell($table, $subs[$i]);
                            $subcell['cellId'] = $result;
                            $subcells[] = $subcell;
                        }
                        Db::name('cellsub')->insertAll($subcells);
                    }
                    echo retJsonMsg();
                    $table[$tableName . 'Id'] = $result;
                    saveLog(Config::get('event')['add'], $tableName, $table);
                } else {
                    echo retJsonMsg('add failed', -1, $result);
                }
            } elseif ($request->isDelete()) {
                $deltable = $request->delete();
                //TODO:先删除子控件,考虑以后需不需要修改
//                Db::name('cellsub')->where('cellId', $deltable['cellId'])->update(array('status' => 0));
                $deltable['status'] = 0;
                $result = Db::name($tableName)->update($deltable);
                if ($result) {
                    echo retJsonMsg();
                    saveLog(Config::get('event')['del'], $tableName, $deltable);
                } else {
                    echo retJsonMsg('del failed', -1, $result);
                }
            } elseif ($request->isPut()) {
                $table = $request->put();
                $cell = $this->getCell($table);
                $cell['cellId'] = $table['cellId'];
                $result = Db::name($tableName)->update($cell);
                if ($result>=0) {
                    //修改子控件
                    if ($request->has('subcell')) {
                        //先删除子控件
                        Db::name('cellsub')->where('cellId', $table['cellId'])->delete();
                        $subs = $table['subcell'];
                        for ($i = 0; $i < sizeof($subs); $i++) {
                            $subcell = $this->getCell($table, $subs[$i]);
                            $subcell['cellId'] = $table['cellId'];
                            $subcells[] = $subcell;
                        }
                        Db::name('cellsub')->insertAll($subcells);
                    }
                    echo retJsonMsg();
                    saveLog(Config::get('event')['edit'], $tableName, $table);
                } else {
                    echo retJsonMsg('edit failed', -1, $result);
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
                $tables = $db->select();
                if ($request->isAjax()) {
                    $resultdata['total'] = $db->count();
                    $resultdata['rows'] = $tables;
                    echo json_encode($resultdata);
                } else {
                    echo json_encode($tables);
                }
            }
//        }catch (Exception $e){
//            echo retJsonMsg('exception',-1,$e);
//        }
    }

    private function getCell($data, $str=''){
        $subcell = array();
        $subcell["celltypeId"] = $data[$str."celltypeId"];
        $subcell["imageurl1"] = $data[$str."imageurl1"];
        $subcell["imageurl2"] = $data[$str."imageurl2"];
        $subcell["width"] = (int)$data[$str."width"];
        $subcell["height"]= (int)$data[$str."height"];
        $subcell["textTitle"] = $data[$str."textTitle"];
        $subcell["textSize"] = empty($data[$str."textSize"])?24:$data[$str."textSize"];
        $subcell["textColor"]= $data[$str."textColor"];
        $subcell["textFont"]= $data[$str."textFont"];
        $subcell["textLeft"] = empty($data[$str."textLeft"])?0:$data[$str."textLeft"];
        $subcell["textTop"] = empty($data[$str."textTop"])?0:$data[$str."textTop"];
        $subcell["textRight"] = empty($data[$str."textRight"])?0:$data[$str."textRight"];
        $subcell["textBottom"] = empty($data[$str."textBottom"])?0:$data[$str."textBottom"];
        $subcell["textAlign"] = $data[$str."textAlign"];
        $subcell["launchAction"] = $data[$str."launchAction"];
        $subcell["acceptAction"] = $data[$str."acceptAction"];
        $subcell["event"] = $data[$str."event"];
        $subcell["remark"] = $data[$str."remark"];
        $subcell['ip'] = request()->ip();
        $subcell['userid'] = Session::get('userid');
        return $subcell;
    }

}
