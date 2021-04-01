<?php

namespace app\flyuiapi\controller;


use think\Config;
use think\Db;
use think\Exception;
use think\Request;
use think\Session;

class BaseRestful extends Base
{
    public function handle($tableName, $order = null, $joins = null, $field = null)
    {
        try {
            $request = Request::instance();
            if ($request->isPost()) {
                $table = $request->post();;
                $table['ip'] = $request->ip();
                $table['userid'] = Session::get('userid');
                $result = Db::name($tableName)->insert($table, false, true);
                if ($result) {
                    $table[$tableName . 'Id'] = $result;
                    echo retJsonMsg("success!",0,$table);
                    saveLog(Config::get('event')['add'], $tableName, $table);
                } else {
                    echo retJsonMsg('add failed', -1, $result);
                }
            }elseif ($request->isDelete()) {
                $deltable = $request->delete();
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
                $table['ip'] = $request->ip();
                $table['userid'] = Session::get('userid');
                $result = Db::name($tableName)->update($table);
                if ($result) {
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
                    $db->where('a.status', 1);
                    foreach ($joins as $v) {
                        $db->join($v[0], $v[1], $v[2]);
                    }
                } else{
                    $db->where('status', 1);
                }

                if(empty($field)){
                    $db->field('status,userid,ip', true);
                }else{
                    $db->field($field);
                }
                if ($request->has('id', 'get')) {
                    $item = $db->where($tableName.'Id', $_GET['id'])->find();
                    if ($item) {
                        echo retJsonMsg("find ok!", 0, $item);
                    } else {
                        echo retJsonMsg('find failed!', -1);
                    }
                }else {
                    $tables = $db->select();
                    if ($request->isAjax()) {
                        $resultdata['total'] = $db->where('status', 1)->count();
                        $resultdata['rows'] = $tables;
                        $resultdata['msg'] = "success!";
                        $resultdata['code'] = 0;
                        echo json_encode($resultdata);
                    } else {
                        echo retJsonMsg($tables);
                    }
                }
            }
        } catch (Exception $e) {
            echo retJsonMsg('exception', -1, $e);
        }
    }

}