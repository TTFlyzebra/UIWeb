<?php

namespace app\api\controller;


class Cellpage extends BaseRestful
{
    public function index()
    {
        $this->handle('cellpage');
    }

}
