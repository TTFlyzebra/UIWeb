<?php

namespace app\admin\controller;

use think\Controller;

class Uiscreen extends Controller
{
    public function index()
    {
        return $this->fetch();
    }
}
