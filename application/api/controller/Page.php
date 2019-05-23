<?php

namespace app\api\controller;

class Page extends BaseRestful
{
    public function index()
    {
        $joins = [
            [
                "fly_theme b",
                "a.themeId=b.themeId",
                'INNER'
            ]
        ];
        $field = getPageFiled();
        $this->handle('page', 'edittime desc', $joins, $field);
    }

}
