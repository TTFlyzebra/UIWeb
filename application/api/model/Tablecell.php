<?php

namespace app\index\model;

use think\Model;

class Tablecell extends Model
{
    public function cells()
    {
        return $this->belongsToMany('cell');
    }
}