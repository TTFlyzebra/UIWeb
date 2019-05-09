<?php

namespace app\api\controller;

use think\Request;

class Test
{
    public function index()
    {
        $request = Request::instance();
        dump($request->param());
    }

}
