<?php

namespace app\api\controller;

use think\Controller;
use think\Request;

class Cell extends Controller
{
    public function index()
    {
        $request = Request::instance();
        if ($request->isPost()) {
        } elseif ($request->isGet()) {
        }
    }

}
