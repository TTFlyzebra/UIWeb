<?php

namespace app\index\model;

use think\Model;

class Pagecell extends Model
{
    public function cells()
    {
        return $this->belongsToMany('cell');
    }
}