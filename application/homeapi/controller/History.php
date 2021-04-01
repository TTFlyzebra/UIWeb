<?php

namespace app\homeapi\controller;


class History extends BaseRestful
{
    public function index()
    {
        $this->handle('history');
    }

}
