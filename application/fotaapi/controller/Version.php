<?php

namespace app\fotaapi\controller;

use think\response\Json;

class Test
{
    public function index()
    {
        $data = [
            "aaaaa",
            "bbbbb",
            "ccccc"
        ];
        echo json_encode($data);
    }
}
