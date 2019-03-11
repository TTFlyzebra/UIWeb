<?php

namespace app\api\controller;


class History extends BaseRestful
{
    public function index()
    {
        $this->handle('history');
    }

}
