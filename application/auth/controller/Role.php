<?php

namespace app\auth\controller;

use app\auth\common\Rbac;
use think\Db;
use think\Exception;
use think\Request;
use think\Session;

class Role extends Auth
{
    public function index()
    {
        return $this->fetch();
    }

    public function add()
    {
        return $this->fetch();
    }

    public function edit()
    {
        $request = Request::instance();
        if ($request->has('id', 'get')) {
            $db = Db::name('role');
            $item = $db->where('id', $_GET['id'])->find();
            $this->assign('item', $item);
            return $this->fetch();
        }
    }

    public function api()
    {
        $rbacObj = new Rbac();
        $request = Request::instance();
        if ($request->isDelete()) {
            $delrole = $request->only('id');
            try {
                if(Db::name("role")->where('id',$delrole['id'])->delete()){
//                if ($rbacObj->delRole($delrole['id'])) {
                    echo retJsonMsg();
                } else {
                    echo retJsonMsg('del failed', -1);
                }
            } catch (Exception $e) {
                echo retJsonMsg('del exception', -1,$e);
            }
        } elseif ($request->isPut()) {
            $role = $request->put();
            try {
                if ($rbacObj->editRole($role)) {
                    echo retJsonMsg();
                } else {
                    echo retJsonMsg('edit failed', -1);
                }
            } catch (Exception $e) {
                echo retJsonMsg('edit exception', -1, $e);
            }
        } elseif ($request->isPost()) {
            $role = $request->post();
            $role['userid'] = Session::get('userid');
            $role['ip'] = request()->ip();
            $role['sort_num'] = 0;
            try {
                if ($rbacObj->createRole($role)) {
                    echo retJsonMsg();
                } else {
                    echo retJsonMsg('create failed', -1);
                }
            } catch (Exception $e) {
                echo retJsonMsg('create exception', -1, $e);
            }
        } elseif ($request->isGet()) {
            $db = Db::name("role");
            if ($request->has('limit', 'get') && $request->has('offset', 'get')) {
                $db->limit($_GET['offset'], $_GET['limit']);
            }
            $roles = $db->select();
            if ($request->isAjax()) {
                $resultdata['total'] = $db->count();
                $resultdata['rows'] = $roles;
                echo json_encode($resultdata);
            } else {
                echo retJsonMsg( $roles);
            }
        } else {
            echo retJsonMsg('error', -1);
        }
    }

    public function test(){
    }

}
