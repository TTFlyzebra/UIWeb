<?php

use think\Db;
use think\Session;


function getCellFiled()
{
    return ['a.cellId', 'a.description', 'a.themeId', 'a.celltypeId', 'c.themeName', 'a.resId', 'a.width', 'a.height',
        'a.backColor', 'a.filterColor', 'a.recv', 'a.send', 'a.texts', 'a.images', 'a.pages', 'a.remark', 'a.uptime',
        'b.celltype', 'b.celltypeName'];
}

function getSubCellFiled()
{
    return ['a.subcellId', 'a.cellId', 'a.description', 'a.themeId', 'a.celltypeId', 'c.themeName', 'a.resId', 'a.width',
        'a.height', 'a.backColor', 'a.filterColor', 'a.recv', 'a.send', 'a.texts', 'a.images', 'a.pages', 'a.remark', 'a.uptime',
        'b.celltype', 'b.celltypeName'];
}

function getPageCellFiled()
{
    return ['a.cellId', 'a.x', 'a.y', 'a.width', 'a.height', 'b.description', 'b.themeId', 'b.celltypeId',
        'b.resId', 'b.backColor', 'b.filterColor', 'b.recv', 'b.send', 'b.texts', 'b.images', 'b.pages',
        'b.remark', 'b.uptime', 'c.celltype', 'c.celltypeName', 'c.imageurl' => 'typeimageurl'];
}

function getPagecell($pageId)
{
    $pagedata = Db::name('pagecell')
        ->where('pageId', $pageId)
        ->alias('a')
        ->join("fly_cell b", "a.cellId=b.cellId")
        ->join("fly_celltype c", "b.celltypeId=c.celltypeId")
        ->field(getPageCellFiled())
        ->select();
    return $pagedata;
}

function getSubCells($cellId)
{
    $subcells = Db::name('cellsub')
        ->alias('a')
        ->join("fly_celltype b", "a.celltypeId=b.celltypeId")
        ->where('a.cellId', $cellId)
        ->where('a.status', 1)
        ->field(["a.cellsubId" => "cellId", 'a.resId', "a.width", "a.height", "a.imageurl1", "a.imageurl2", "a.backcolor",
            "a.textTitle", "a.textSize", "a.textColor", 'a.mTop', 'a.mBottom', 'a.mLeft',
            'a.mRight', 'textLine', "a.gravity", "a.textFont", "a.sendAction", "a.recvAction", "a.clickevent",
            "a.remark", "a.extend", "b.celltype"])
        ->select();
    return $subcells;
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
        $subCells = getSubCells($cellList[$n]['cellId']);
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

function getCell($data, $str = '0_')
{
    $cell = array();
    if (isset($data[$str . "cellId"]) && $data[$str . "cellId"] > 0) {
        $cell["cellId"] = $data[$str . "cellId"];
    }
    if (isset($data[$str . "subcellId"]) && $data[$str . "subcellId"] > 0) {
        $cell["subcellId"] = $data[$str . "subcellId"];
    }
    $cell["description"] = $data[$str . "description"];
    $cell["themeId"] = (int)$data[$str . "themeId"];
    $cell["celltypeId"] = (int)$data[$str . "celltypeId"];
    $cell["resId"] = (int)$data[$str . "resId"];
    $cell["width"] = (int)$data[$str . "width"];
    $cell["height"] = (int)$data[$str . "height"];
    $cell["backColor"] = $data[$str . "backColor"];
    $cell["filterColor"] = $data[$str . "filterColor"];
    $cell["recv"] = $data[$str . "recv"];
    $cell["send"] = $data[$str . "send"];
    if (isset($data[$str . "text"])) {
        for ($i = 0; $i < sizeof($data[$str . "text"]); $i++) {
            $texts[$i]['text'] = $data[$str . "text"][$i];
            $texts[$i]['textSize'] = (int)$data[$str . "textSize"][$i];
            $texts[$i]['textLines'] = (int)$data[$str . "textLines"][$i];
            $texts[$i]['textColor'] = $data[$str . "textColor"][$i];
            $texts[$i]['textFilter'] = $data[$str . "textFilter"][$i];
            $texts[$i]['left'] = (int)$data[$str . "textLeft"][$i];
            $texts[$i]['top'] = (int)$data[$str . "textTop"][$i];
            $texts[$i]['right'] = (int)$data[$str . "textRight"][$i];
            $texts[$i]['bottom'] = (int)$data[$str . "textBottom"][$i];
            $texts[$i]['gravity'] = (int)$data[$str . "textGravity"][$i];
            $texts[$i]['recv'] = $data[$str . "textRecv"][$i];
            $texts[$i]['send'] = $data[$str . "textSend"][$i];
        }
        $cell["texts"] = json_encode($texts);
    } else {
        $cell["texts"] = "[]";
    }
    if (isset($data[$str . "imageUrl"])) {
        for ($i = 0; $i < sizeof($data[$str . "imageUrl"]); $i++) {
            $images[$i]['width'] = (int)$data[$str . "imageWidth"][$i];
            $images[$i]['height'] = (int)$data[$str . "imageHeight"][$i];
            $images[$i]['url'] = $data[$str . "imageUrl"][$i];
            $images[$i]['filterColor'] = $data[$str . "imageFilter"][$i];
            $images[$i]['left'] = (int)$data[$str . "imageLeft"][$i];
            $images[$i]['top'] = (int)$data[$str . "imageTop"][$i];
            $images[$i]['right'] = (int)$data[$str . "imageRight"][$i];
            $images[$i]['bottom'] = (int)$data[$str . "imageBottom"][$i];
            $images[$i]['scaleType'] = (int)$data[$str . "scaleType"][$i];
            $images[$i]['recv'] = $data[$str . "imageRecv"][$i];
            $images[$i]['send'] = $data[$str . "imageSend"][$i];
        }
        $cell["images"] = json_encode($images);
    } else {
        $cell["images"] = "[]";
    }
    $pages = [];
    $cell["pages"] = json_encode($pages);
    $cell["remark"] = $data[$str . "remark"];
    $cell['userid'] = Session::get('userid');
    $cell['ip'] = request()->ip();
    return $cell;
}

function replaceJsonCell($cell)
{
    $cell['texts'] = json_decode($cell['texts']);
    $cell['images'] = json_decode($cell['images']);
    $cell['pages'] = json_decode($cell['pages']);
    $subfield = getSubCellFiled();
    $db = Db::name('subcell');
    $db->alias('a');
    $db->join("fly_celltype b", "a.celltypeId=b.celltypeId", 'INNER');
    $db->join("fly_theme c", "a.themeId=c.themeId", 'INNER');
    $db->field($subfield);
    $subcells = $db->where('cellId', $cell['cellId'])->select();
    if ($subcells) {
        for ($i = 0; $i < sizeof($subcells); $i++) {
            $subcells[$i]['texts'] = json_decode($subcells[$i]['texts']);
            $subcells[$i]['images'] = json_decode($subcells[$i]['images']);
            $subcells[$i]['pages'] = json_decode($subcells[$i]['pages']);
        }
        $cell['subCells'] = $subcells;
    }
    return $cell;
}

function getAllPagecell($pageId)
{
    $pagedata = Db::name('pagecell')
        ->where('pageId', $pageId)
        ->alias('a')
        ->join("fly_cell b", "a.cellId=b.cellId")
        ->join("fly_celltype c", "b.celltypeId=c.celltypeId")
        ->field(getPageCellFiled())
        ->select();
    return $pagedata;
}
