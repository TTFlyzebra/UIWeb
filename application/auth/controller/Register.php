<?php

namespace app\auth\controller;

use think\Controller;

class Register extends Controller
{
    public function index()
    {
        return $this->fetch();
    }

}
