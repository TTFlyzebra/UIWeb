<?php

namespace app\api\controller;


class About extends BaseRestful
{
    public function index()
    {
        $this->handle('about');
    }

}
