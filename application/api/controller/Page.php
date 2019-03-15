<?php

namespace app\api\controller;

class Page extends BaseRestful
{
    public function index()
    {
        $this->handle('page');
    }

}
