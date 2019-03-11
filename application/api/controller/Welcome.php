<?php

namespace app\api\controller;

class Welcome extends BaseRestful
{
    public function index()
    {
        $this->handle('welcome','welcomeSort asc');
    }

}
