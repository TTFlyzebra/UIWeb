<?php

use think\Db;

function retmsg($message="", $ret="0", $data=""){
    $msg = array();
    $msg['msg']=$message;
    $msg['ret']=$ret;
    $msg['data'] = $data;
    return json_encode($msg);
}

function getPagecell($pageId)
{
    $pagedata = Db::name('pagecell')
        ->where('pageId', $pageId)
        ->alias('a')
        ->join("fly_cell b", "a.cellId=b.cellId")
        ->join("fly_celltype c", "b.celltypeId=c.celltypeId")
        ->field('a.cellId,x,y,a.width,a.height,celltype,
                    themeName,imageurl1,imageurl2,textTitle,textSize,textColor,textAlign,
                    textFont,textTop,textBottom,textLeft,textRight,packName,className,
                    action,flyAction,intentFlag,b.extend,b.remark')
        ->select();
    return $pagedata;
}