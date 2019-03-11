<?php
/**
 * Created by PhpStorm.
 * User: fengyun
 * Date: 2019/3/11
 * Time: 10:40
 */

namespace app\api\controller;


use think\Config;
use think\Db;
use think\Exception;
use think\Request;
use think\Session;

class BaseRestful
{
    public function handle($tableName, $order = null)
    {
        try {
            $request = Request::instance();
            if ($request->isDelete()) {
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
                $table['ip'] = request()->ip();
                $table['userid'] = Session::get('userid');
                $result = Db::name($tableName)->update($table);
                if ($result) {
                    echo retJsonMsg();
                    saveLog(Config::get('event')['edit'], $tableName, $table);
                } else {
                    echo retJsonMsg('edit failed', -1, $result);
                }
            } elseif ($request->isPost()) {
                $table = $request->post();;
                $table['ip'] = request()->ip();
                $table['userid'] = Session::get('userid');
                $result = Db::name($tableName)->insert($table,false,true);
                if ($result) {
                    echo retJsonMsg();
                    $table[$tableName . 'Id'] = $result;
                    saveLog(Config::get('event')['add'], $tableName, $table);
                } else {
                    echo retJsonMsg('add failed', -1, $result);
                }
            } elseif ($request->isGet()) {
                $db = Db::name($tableName);
                $db->where('status', 1);
                if ($order) {
                    $db->order($order);
                }
                if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
                    $db->limit($_GET['offset'], $_GET['limit']);
                }
                $db->field('userid,ip', true);
                $tables = $db->select();
                if ($request->isAjax()) {
                    $resultdata['total'] = $db->count();
                    $resultdata['rows'] = $tables;
                    echo json_encode($resultdata);
                } else {
                    echo json_encode($tables);
                }
            }
        } catch (Exception $e) {
            echo retJsonMsg('exception', -1, $e);
        }
    }

}