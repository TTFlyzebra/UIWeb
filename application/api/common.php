<?php

use think\Db;

function getPagecell($pageId)
{
    $pagedata = Db::name('pagecell')
        ->where('pageId', $pageId)
        ->alias('a')
        ->join("fly_cell b", "a.cellId=b.cellId")
        ->join("fly_celltype c", "b.celltypeId=c.celltypeId")
        ->field(['a.cellId', 'x', 'y', 'a.width', 'a.height', 'celltype', 'imageurl1',
            'imageurl2','b.backcolor', 'textTitle', 'textSize', 'textColor', 'gravity',
            'textFont', 'mTop', 'mBottom', 'mLeft', 'mRight',
            'sendAction', 'recvAction', 'clickevent', 'b.extend', 'b.remark',
            'c.celltypeName', 'c.imageurl'=>'typeimageurl'])
        ->select();
    return $pagedata;
}