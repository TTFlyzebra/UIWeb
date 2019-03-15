<?php

namespace app\api\controller;

class Theme extends BaseRestful
{
    public function index()
    {
        $this->handle('theme');
    }

}
