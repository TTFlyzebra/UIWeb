<?php

namespace app\homeapi\controller;

class Welcome extends BaseRestful
{
    public function index()
    {
        $this->handle('welcome','welcomeSort asc');
    }

}
