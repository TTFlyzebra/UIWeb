<?php

namespace app\homeapi\controller;


class About extends BaseRestful
{
    public function index()
    {
        $this->handle('about');
    }

}
