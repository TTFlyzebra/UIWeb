<?php

namespace app\auth\controller;

use think\Db;
use think\Request;

class User extends Auth
{
    public function index()
    {
        $roles = Db::name('role')->select();
        $this->assign('list', $roles);
        return $this->fetch();
    }

    public function api()
    {
        $request = Request::instance();
        if ($request->isDelete()) {
        } elseif ($request->isPut()) {
        } elseif ($request->isPost()) {
        } elseif ($request->isGet()) {
            $db = Db::name("user");
            if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
                $db->limit($_GET['offset'], $_GET['limit']);
            }
            $users = $db->alias('a')
                ->join("fly_user_role b", "a.id=b.user_id", 'LEFT')
                ->join('fly_role c', "b.role_id=c.id", 'LEFT')
                ->field(['a.id', 'a.user_name', 'a.mobile', 'a.email', 'a.last_login_time',
                    'a.status', 'a.createtime', 'a.ip', 'b.role_id', 'c.name' => 'role_name'])
                ->select();
            if ($request->isAjax()) {
                $resultdata['total'] = $db->count();
                $resultdata['rows'] = $users;
                echo json_encode($resultdata);
            } else {
                echo retJsonMsg($users);
            }
        } else {
            echo retJsonMsg('error', -1);
        }
    }

    public function repswd()
    {

    }

    public function setrole(){
        dump($_POST);
    }


}
