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
        'a.height', 'a.backColor', 'a.filterColor', 'a.recv', 'a.send', 'a.texts', 'a.images', 'a.pages', 'a.remark',
        'b.celltype', 'b.celltypeName'];
}

function getPageCellFiled()
{
    return ['a.cellId', 'a.x', 'a.y', 'b.width', 'b.height', 'b.description', 'b.themeId', 'b.celltypeId',
        'b.resId', 'b.backColor', 'b.filterColor', 'b.recv', 'b.send', 'b.texts', 'b.images', 'b.pages',
        'b.remark', 'c.celltype'];
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
    for ($j = 0; $j < sizeof($pagedata); $j++) {
        $pagedata[$j] = replaceJsonCell($pagedata[$j]);
    }
    return $pagedata;
}

function getSubCells($cellId)
{
    $subcells = Db::name('subcell')
        ->alias('a')
        ->join("fly_celltype b", "a.celltypeId=b.celltypeId", 'INNER')
        ->join("fly_theme c", "a.themeId=c.themeId", 'INNER')
        ->where('a.cellId', $cellId)
        ->where('a.status', 1)
        ->field(getSubCellFiled())
        ->select();
    return $subcells;
}

function getPageBean($pageId, $getsub = true)
{
    $cellList = getPagecell($pageId);
    for ($n = 0; $n < sizeof($cellList); $n++) {
        if (!empty($cellList[$n]['cellpageId']) && $getsub) {
            $cellList[$n]['cellpage'] = getPageBean($cellList[$n]['cellpageId'], false);
        }
    }
    $pageBean['pageId'] = $pageId;
    $pageBean['cellList'] = $cellList;
    return $pageBean;
}

function getPostCell($data, $str = '0_')
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
    if (isset($data[$str . "text"]) && !empty($data[$str . "text"])) {
        for ($i = 0; $i < sizeof($data[$str . "text"]); $i++) {
            $texts[$i]['text'] = empty($data[$str . "text"][$i]) ? NULL : $data[$str . "text"][$i];
            $texts[$i]['textSize'] = (int)$data[$str . "textSize"][$i];
            $texts[$i]['textLines'] = (int)$data[$str . "textLines"][$i];
            $texts[$i]['textColor'] = $data[$str . "textColor"][$i];
            $texts[$i]['textFilter'] = $data[$str . "textFilter"][$i];
            $texts[$i]['left'] = (int)$data[$str . "textLeft"][$i];
            $texts[$i]['top'] = (int)$data[$str . "textTop"][$i];
            $texts[$i]['right'] = (int)$data[$str . "textRight"][$i];
            $texts[$i]['bottom'] = (int)$data[$str . "textBottom"][$i];
            $texts[$i]['gravity'] = (int)$data[$str . "textGravity"][$i];
            $texts[$i]['recv'] = empty($data[$str . "textRecv"][$i]) ? NULL : $data[$str . "textRecv"][$i];
            $texts[$i]['send'] = empty($data[$str . "textSend"][$i]) ? NULL : $data[$str . "textSend"][$i];
        }
        $cell["texts"] = json_encode($texts);
    } else {
        $cell["texts"] = "[]";
    }
    if (isset($data[$str . "imageUrl"]) && !empty($data[$str . "imageUrl"])) {
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
            $images[$i]['recv'] = empty($data[$str . "imageRecv"][$i]) ? NULL : $data[$str . "imageRecv"][$i];
            $images[$i]['send'] = empty($data[$str . "imageSend"][$i]) ? NULL : $data[$str . "imageSend"][$i];
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
    $cell['texts'] = json_decode($cell['texts'], true);
    if (is_array($cell['texts'])) {
        for ($ti = 0; $ti < sizeof($cell['texts']); $ti++) {
            if (!empty($cell['texts'][$ti]['text'])) {
                $cell['texts'][$ti]['text'] = json_decode($cell['texts'][$ti]['text'], true);
            }
            if (!empty($cell['texts'][$ti]['recv'])) {
                $cell['texts'][$ti]['recv'] = json_decode($cell['texts'][$ti]['recv'], true);
            }
            if (!empty($cell['texts'][$ti]['send'])) {
                $cell['texts'][$ti]['send'] = json_decode($cell['texts'][$ti]['send'], true);
            }
        }
    }
    $cell['images'] = json_decode($cell['images'], true);
    if (is_array($cell['images'])) {
        for ($ii = 0; $ii < sizeof($cell['images']); $ii++) {
            if (!empty($cell['images'][$ii]['recv'])) {
                $cell['images'][$ii]['recv'] = json_decode($cell['images'][$ii]['recv']);
            }
            if (!empty($cell['images'][$ii]['send'])) {
                $cell['images'][$ii]['send'] = json_decode($cell['images'][$ii]['send']);
            }
        }
    }
    $cell['pages'] = json_decode($cell['pages']);
    $cell['recv'] = json_decode($cell['recv']);
    $cell['send'] = json_decode($cell['send']);
    $db = Db::name('subcell');
    $db->alias('a');
    $db->join("fly_celltype b", "a.celltypeId=b.celltypeId", 'INNER');
    $db->join("fly_theme c", "a.themeId=c.themeId", 'INNER');
    $db->field(getSubCellFiled());
    $subcells = $db->where('cellId', $cell['cellId'])->select();
    if ($subcells) {
        for ($i = 0; $i < sizeof($subcells); $i++) {
            $subcells[$i]['texts'] = json_decode($subcells[$i]['texts'], true);
            if (is_array($subcells[$i]['texts'])) {
                for ($sti = 0; $sti < sizeof($subcells[$i]['texts']); $sti++) {
                    if (!empty($subcells[$i]['texts'][$sti]['text'])) {
                        $subcells[$i]['texts'][$sti]['text'] = json_decode($subcells[$i]['texts'][$sti]['text'], true);
                    }
                    if (!empty($subcells[$i]['texts'][$sti]['recv'])) {
                        $subcells[$i]['texts'][$sti]['recv'] = json_decode($subcells[$i]['texts'][$sti]['recv'], true);
                    }
                    if (!empty($subcells[$i]['texts'][$sti]['send'])) {
                        $subcells[$i]['texts'][$sti]['send'] = json_decode($subcells[$i]['texts'][$sti]['send'], true);
                    }
                }
            }
            $subcells[$i]['images'] = json_decode($subcells[$i]['images'], true);
            if (is_array($subcells[$i]['images'])) {
                for ($sii = 0; $sii < sizeof($subcells[$i]['images']); $sii++) {
                    if (!empty($subcells[$i]['images'][$sii]['recv'])) {
                        $subcells[$i]['images'][$sii]['recv'] = json_decode($subcells[$i]['images'][$sii]['recv']);
                    }
                    if (!empty($subcells[$i]['images'][$sii]['send'])) {
                        $subcells[$i]['images'][$sii]['send'] = json_decode($subcells[$i]['images'][$sii]['send']);
                    }
                }
            }
            $subcells[$i]['pages'] = json_decode($subcells[$i]['pages'], true);
            $subcells[$i]['send'] = json_decode($subcells[$i]['send']);
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
