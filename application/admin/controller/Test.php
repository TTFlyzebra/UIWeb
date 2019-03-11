<?php

namespace app\admin\controller;

use think\Config;
use think\Controller;

class Test extends Controller
{
    public function index()
    {
        dump( Config::get('event')['del']);
    }

}
