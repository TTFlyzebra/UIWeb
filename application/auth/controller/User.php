<?php

namespace app\auth\controller;

use gmars\rbac\Rbac;
use think\Db;
use think\Request;

class User extends Auth
{
    public function index()
    {
        return $this->fetch();
    }

}
