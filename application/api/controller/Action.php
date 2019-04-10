<?php

namespace app\api\controller;


class Action
{
    public function index()
    {
        echo json_encode(getAction());
    }

}
