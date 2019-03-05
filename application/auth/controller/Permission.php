<?php

namespace app\auth\controller;

use gmars\rbac\Rbac;
use think\Db;
use think\Exception;
use think\Request;

class Permission extends Auth
{
    public function index()
    {
        $data = DB::name('permission')->select();
        $node = node_merge($data);
        $this->assign('list', $node);
        return $this->fetch();
    }

    public function add()
    {
        $request = Request::instance();
        if ($request->isPost()) {
            $param = $request->param();
            $validate = $this->validate($param, 'Permission');
            if (true === $validate) {
                $param['create_time'] = time();
                $param['ip'] = $request->ip();
                $rbacObj = new Rbac();
                try {
                    if($rbacObj->createPermission($param)){
                        echo retJsonMsg();
                    }else{
                        echo retJsonMsg("db insert error",-1);
                    }
                } catch (Exception $e) {
                    echo retJsonMsg("catch Exception",-1,$e);
                }
            } else {
                echo retJsonMsg($validate,-1);
            }
        } else {
            echo retJsonMsg("error",-1);
        }
    }

    public function edit()
    {
    }
}
