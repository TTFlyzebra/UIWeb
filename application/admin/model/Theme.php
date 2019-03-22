<?php
/**
 * Created by PhpStorm.
 * User: fengyun
 * Date: 2019/3/19
 * Time: 15:44
 */

namespace app\admin\model;


use think\Model;

class Theme extends Model
{
    public function pages(){
        return $this->belongsToMany('page','themepage','themeId','pageId');
    }

}