<?php

namespace app\fotaapi\controller;

class Flyos extends BaseRestful
{
    public function index()
    {
        $this->handle('os');
    }
 }
