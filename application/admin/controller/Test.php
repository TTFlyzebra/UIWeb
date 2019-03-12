<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;

class Test extends Controller
{
    public function index()
    {
        $request = Request::instance();
        dump($request->param());
    }

}
