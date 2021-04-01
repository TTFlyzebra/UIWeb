<?php

namespace app\flyuiapi\controller;

use think\Request;

class Test
{
    public function index()
    {
        $request = Request::instance();
        dump($request->param());
    }

}
