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
            'imageurl2', 'b.backcolor', 'textTitle', 'textSize', 'textColor', 'gravity',
            'textFont', 'mTop', 'mBottom', 'mLeft', 'mRight', "acceptAction", "launchAction",
            'sendAction', 'recvAction', 'clickevent', 'b.extend', 'b.remark', 'b.cellpageId',
            'c.celltypeName', 'c.imageurl' => 'typeimageurl'])
        ->select();
    return $pagedata;
}

function getPageBean($pageId, $getsub = true)
{
    $cellList = getPagecell($pageId);
    for ($n = 0; $n < sizeof($cellList); $n++) {
        $cellList[$n]['textTitle'] = array(
            'zh' => $cellList[$n]['textTitle']
        );

        if (!empty($cellList[$n]['cellpageId']) && $getsub) {
            $cellList[$n]['cellpage'] = getPageBean($cellList[$n]['cellpageId'], false);
        }

        $subCells = Db::name('cellsub')
            ->alias('a')
            ->join("fly_celltype b", "a.celltypeId=b.celltypeId")
            ->where('cellId', $cellList[$n]['cellId'])
            ->where('a.status', 1)
            ->field(["a.cellId","b.celltype", "a.mLeft" => "x", "a.mTop" => "y", "a.width", "a.height",
                "a.imageurl1", "a.imageurl2", "a.backcolor", "a.textTitle", "a.textSize", "a.textColor",
                "a.gravity", "a.textFont", "a.sendAction", "a.recvAction", "a.clickevent", "a.remark", "a.extend"])
            ->select();
        for ($t = 0; $t < sizeof($subCells); $t++) {
            $subCells[$t]['textTitle'] = array(
                'zh' => $subCells[$t]['textTitle']
            );
        }
        $cellList[$n]['subCells'] = $subCells;
    }
    $pageBean['pageId'] = $pageId;
    $pageBean['cellList'] = $cellList;
    return $pageBean;
}