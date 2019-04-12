<?php

namespace app\admin\controller;

use think\Config;
use think\Controller;
use think\Db;
use think\Request;

class Log extends Controller
{
    public function _initialize()
    {
        parent::_initialize();
        //判断管理员是否登录
        if (!session('userid')) {
            $this->redirect(url('auth/login/index'));
        }
    }

    public function index()
    {
        return $this->fetch();
    }

    public function api()
    {
        $request = Request::instance();
        if ($request->isGet()) {
            $db = Db::name('user_log');
            if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
                $db->limit($_GET['offset'], $_GET['limit']);
            }
            $tables = $db->alias('a')
                ->join('fly_user b', 'a.userid=b.id')
                ->field(['a.id', 'a.createtime', 'b.user_name', 'a.event', 'a.data', 'a.tableName'])
                ->order('a.createtime desc')
                ->select();
            for ($i = 0; $i < sizeof($tables); $i++) {
                $tables[$i]['text'] = $tables[$i]['createtime']
                    . '用户['
                    . $tables[$i]['user_name']
                    . ']'
                    . Config::get('event')[$tables[$i]['event']]['text'];
                if (!empty($tables[$i]['data'])) {
                    $tables[$i]['text'] = $tables[$i]['text']
                        . '['
                        . $tables[$i]['tableName']
                        . '：'
                        . $tables[$i]['data']
                        . ']';
                }
            }
            if ($request->isAjax()) {
                $resultdata['total'] = $db->count();
                $resultdata['rows'] = $tables;
                echo json_encode($resultdata);
            } else {
                echo json_encode($tables);
            }
        }
    }

}
