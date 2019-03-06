<?php

namespace app\auth\controller;

use app\auth\common\Rbac;
use think\Db;
use think\Exception;
use think\Request;
use think\Session;

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
                try {
                    $param['create_time'] = time();
                    $param['ip'] = $request->ip();
                    $param['userid'] = Session::get('userid');
                    $rbacObj = new Rbac();
                    if ($rbacObj->createPermission($param)) {
                        echo retJsonMsg();
                    } else {
                        echo retJsonMsg("db insert error", -1);
                    }
                } catch (Exception $e) {
                    echo retJsonMsg("catch Exception", -1, $e);
                }
            } else {
                echo retJsonMsg($validate, -1);
            }
        } else {
            echo retJsonMsg("error", -1);
        }
    }

    public function edit()
    {
        $request = Request::instance();
        if ($request->isPut()) {
            $param = $request->put();
            $validate = $this->validate($param, 'Permission');
            if (true === $validate) {
                try {
                    $rbacObj = new Rbac();
                    $param['userid'] = Session::get('userid');
                    if ($rbacObj->editPermission($param)) {
                        echo retJsonMsg();
                    } else {
                        echo retJsonMsg("db edit error", -1);
                    }
                } catch (Exception $e) {
                    echo retJsonMsg("catch Exception", -1, $e);
                }
            } else {
                echo retJsonMsg($validate, -1);
            }
        } else {
            echo retJsonMsg("error", -1);
        }
    }

    public function del()
    {
        $request = Request::instance();
        if ($request->isDelete()) {
            $param = $request->param();
            $rbacObj = new Rbac();
            try {
                if ($rbacObj->delPermission($param['id'])) {
                    echo retJsonMsg();
                } else {
                    echo retJsonMsg("db delete error", -1);
                }
            } catch (Exception $e) {
                echo retJsonMsg("catch Exception", -1, $e);
            }
        } else {
            echo retJsonMsg('error', -1);
        }
    }

    public function dispath()
    {
        $roleids = Db::name('role_permission')->where('role_id', $_GET['id'])->field('permission_id')->select();
        $permissions = DB::name('permission')->select();
        $node = node_merge($permissions, $roleids);
        $this->assign('list', $node);
        return $this->fetch();
    }

    public function test(){
        dump($_POST);
    }

    /**
     * 分配权限页面
     */
    public function setAccess(){
        $role_id = $_POST['pid'];
        $data = array();
        foreach ($_POST['nodeid'] as $v){
            $tmp = explode('_', $v);
            $data[] = array(
                'role_id'=>$role_id,
                'node_id'=>$tmp[0],
                'level'=>$tmp[1]
            );
        }
        $db= M('access');
        $db->where(array('role_id'=>$role_id))->delete();
        if($data==null){
            $this->redirect("/Admin/Access/index",array('pid' =>$role_id));
        }else if($db->addAll($data)){
            $this->redirect("/Admin/Access/index",array('pid' =>$role_id));
        }else{
            $this->error($db->getError());
        }

    }
}
