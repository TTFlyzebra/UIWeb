<?php

namespace app\flyuiapi\controller;

use think\Config;
use think\Db;
use think\Request;

class Cell extends BaseRestful
{
    public function index()
    {
        $tableName = 'cell';
        $order = 'cellId desc';
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
        $field = getCellFiled();
        $request = Request::instance();
        if ($request->isPost()) {
            $table = $request->post();
            $prefixs = $table['prefix'];
            $prefixSize = is_array($prefixs) ? sizeof($prefixs) : 0;
            if ($prefixSize > 0) {
                $maincell = getPostCell($table, $prefixs[0]);
                $result = Db::name($tableName)->insert($maincell, false, true);
                if ($result) {
                    //添加子组件
                    if ($prefixSize > 1) {
                        for ($pi = 1; $pi < $prefixSize; $pi++) {
                            $subcell = getPostCell($table, $prefixs[$pi]);
                            $subcell['cellId'] = $result;
                            $subcells[] = $subcell;
                        }
                        $subresult = Db::name('subcell')->insertAll($subcells);
                        if ($subresult) {
                            saveLog(Config::get('event')['add'], "subcell", $subcells);
                        } else {
                            saveLog(Config::get('event')['error'], "subcell", $subcells);
                        }
                    }
                    $maincell['cellId'] = $result;
                    saveLog(Config::get('event')['add'], $tableName, $maincell);
                    echo retJsonMsg("success!", 0, $result);
                } else {
                    saveLog(Config::get('event')['error'], $tableName, $maincell);
                    echo retJsonMsg('add failed', -1, $result);
                }
            } else {
                echo retJsonMsg('parameter error', -1);
            }
        } elseif ($request->isPut()) {
            $table = $request->put();
            $prefixs = $table['prefix'];
            $prefixSize = is_array($prefixs) ? sizeof($prefixs) : 0;
            if ($prefixSize > 0) {
                $maincell = getPostCell($table, $prefixs[0]);
                //TODO:编辑子组件 有时间优化操作，只更新不删除，性能优化
                if ($prefixSize > 1) {
                    //删除要删除的
                    $subcellIds = Db::name('subcell')->field('subcellId')->where('cellId', $maincell['cellId'])->select();
                    if ($subcellIds) {
                        for ($si = 0; $si < sizeof($subcellIds); $si++) {
                            $subId = $subcellIds[$si]['subcellId'];
                            $find = false;
                            for ($pi = 1; $pi < $prefixSize; $pi++) {
                                if (isset($table[$prefixs[$pi] . "subcellId"]) && ($table[$prefixs[$pi] . "subcellId"] == $subId)) {
                                    $find = true;
                                    break;
                                }
                            }
                            if (!$find) {
                                $subresult = Db::name('subcell')->where('subcellId', $subId)->delete();
                                if ($subresult) {
                                    saveLog(Config::get('event')['del'], "subcell", $subId);
                                } else {
                                    saveLog(Config::get('event')['error'], "subcell", $subId);
                                }
                            }
                        }
                    }
                    //更新添加子组件
                    for ($pi = 1; $pi < $prefixSize; $pi++) {
                        $subcell = getPostCell($table, $prefixs[$pi]);
                        $subcell['cellId'] = $maincell['cellId'];
                        if (isset($subcell["subcellId"])) {
                            $subresult = Db::name('subcell')->update($subcell);
                            if ($subresult) {
                                saveLog(Config::get('event')['edit'], "subcell", $subcell);
                            } else {
                                saveLog(Config::get('event')['error'], "subcell", $subcell);
                            }
                        } else {
                            $subresult = Db::name('subcell')->insert($subcell);
                            if ($subresult) {
                                saveLog(Config::get('event')['add'], "subcell", $subcell);
                            } else {
                                saveLog(Config::get('event')['error'], "subcell", $subcell);
                            }
                        }
                    }
                } else {
                    $subdel = Db::name('subcell')->where('cellId', $maincell['cellId'])->delete();
                    if ($subdel) {
                        saveLog(Config::get('event')['del'], "subcell", $subdel);
                    } else {
                        saveLog(Config::get('event')['error'], "subcell", $subdel);
                    }
                }
                $result = Db::name($tableName)->update($maincell);
                if ($result >= 0) {
                    saveLog(Config::get('event')['edit'], $tableName, $maincell);
                    echo retJsonMsg("success!",0,$maincell['cellId']);
                } else {
                    saveLog(Config::get('event')['error'], $tableName, $maincell);
                    echo retJsonMsg('edit failed', -1, $result);
                }
            } else {
                echo retJsonMsg('parameter error', -1);
            }
        } elseif ($request->isDelete()) {
            $deltable = $request->delete();
            //TODO:先删除子组件,考虑以后需不需要修改
//                Db::name('cellsub')->where('cellId', $deltable['cellId'])->update(array('status' => 0));
            $deltable['status'] = 0;
            $result = Db::name($tableName)->update($deltable);
            if ($result) {
                echo retJsonMsg();
                saveLog(Config::get('event')['del'], $tableName, $deltable);
            } else {
                echo retJsonMsg('del failed', -1, $result);
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
                $maincell = $db->where('cellId', $_GET['id'])->find();
                if ($maincell) {
                    $maincell = replaceJsonCell($maincell);
                    echo retJsonMsg("find ok!", 0, $maincell);
                } else {
                    echo retJsonMsg('find failed!', -1);
                }
            } else {
                $cells = $db->select();
                if ($cells) {
                    for ($pi = 0; $pi < sizeof($cells); $pi++) {
                        $cells[$pi] = replaceJsonCell($cells[$pi]);
                    }
                    if ($request->isAjax() && $request->has('limit', 'get') && $request->has('offset', 'get')) {
                        $resultdata['total'] = $db->where('status', 1)->count();
                        $resultdata['rows'] = $cells;
                        $resultdata['msg'] = "success!";
                        $resultdata['code'] = 0;
                        echo json_encode($resultdata);
                    } else {
                        echo retJsonMsg("list ok", 0, $cells);
                    }
                } else {
                    echo retJsonMsg('error!', -1, $cells);
                }
            }
        }
    }
}
