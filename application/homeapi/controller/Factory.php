<?php

namespace app\homeapi\controller;

use think\exception\ErrorException;

class Factory extends BaseRestful
{
    public function index()
    {
        echo 'http://' . $_SERVER['HTTP_HOST'];
    }

    public function test()
    {
        header("Content-type: text/xml");
        $setjson = "{\"FactorySettings\":{\"Data\":[{\"_key\":\"iFirstRun\",\"_datatype\":\"int\",\"_data\":\"999\"},{\"_key\":\"bBackCarRadar,\",\"_datatype\":\"bool\",\"_data\":false,\"_save\":\"false\"},{\"_key\":\"byBackCarScreen,\",\"_datatype\":\"byte,\",\"_data\":0},{\"_key\":\"bBackCarSubline,\",\"_datatype\":\"bool\",\"_data\":false},{\"_key\":\"bCarInfoIcon,\",\"_datatype\":\"bool\",\"_data\":false},{\"_key\":\"bBackCarIsNeedMute,\",\"_datatype\":\"bool\",\"_data\":false},{\"_key\":\"byBrightnessDS\",\"_datatype\":\"byte\",\"_data\":\"6\"},{\"_key\":\"byChromaDS\",\"_datatype\":\"byte\",\"_data\":\"0\"},{\"_key\":\"byContrastDS\",\"_datatype\":\"byte\",\"_data\":\"3\"},{\"_key\":\"byUsbRate\",\"_datatype\":\"byte\",\"_data\":\"1\"},{\"_key\":\"byUsbMode\",\"_datatype\":\"byte\",\"_data\":\"0\"},{\"_key\":\"bIsNeedAutoPlayMusic\",\"_datatype\":\"bool\",\"_data\":false},{\"_key\":\"bUsb0Dvr\",\"_datatype\":\"bool\",\"_data\":false},{\"_key\":\"bUsb1Dvr\",\"_datatype\":\"bool\",\"_data\":false},{\"_key\":\"bButtonLight\",\"_datatype\":\"bool\",\"_data\":false},{\"_key\":\"bMcuLog\",\"_datatype\":\"bool\",\"_data\":false},{\"_key\":\"byButtonLightColor\",\"_datatype\":\"byte\",\"_data\":\"0\"},{\"_key\":\"byRedColor\",\"_datatype\":\"byte\",\"_data\":\"2\"},{\"_key\":\"byGreenColor\",\"_datatype\":\"byte\",\"_data\":\"3\"},{\"_key\":\"byBlueColor\",\"_datatype\":\"byte\",\"_data\":\"3\"},{\"_key\":\"byRadioLocal\",\"_datatype\":\"byte\",\"_data\":\"0\"},{\"_key\":\"byStandByTime\",\"_datatype\":\"byte\",\"_data\":\"2\"},{\"_key\":\"byLogoIndex\",\"_datatype\":\"byte\",\"_data\":\"0\"}]}}";
        $setdata = json_decode($setjson);

        $defaultxmldata = $this->getDefaultXmlData();
        $defaultdata = $this->simpleXmlDataToFactoryData($defaultxmldata);

        $data = $this->mergeData($setdata, $defaultdata);
        $xml = $this->arrtoXml($data);
        echo $xml;
//        echo json_encode($data);
    }

    public function xmlfile()
    {
        //上传数据
        $setjson = $_POST['factory'];
        $setdata = json_decode($setjson);

        //合并默认数据
        $defaultxmldata = $this->getDefaultXmlData();
        $defaultdata = $this->simpleXmlDataToFactoryData($defaultxmldata);
        $data = $this->mergeData($setdata, $defaultdata);
        $xml = $this->arrtoXml($data);

        $filename = date("YmdHis") . ".xml";
        $fp = fopen("./downfile/" . $filename, 'w');
        fwrite($fp, $xml);
        fclose($fp);

        $ret["url"] = 'http://' . $_SERVER['HTTP_HOST'] . url("/downfile") . '/' . $filename;
        $ret["filename"] = "globaldata.xml";
        echo json_encode($ret);
    }

    private function getDefaultXmlData($file_path = "./config/globaldata.xml")
    {
        if (file_exists($file_path)) {
            $data = simplexml_load_file($file_path);
        } else {
            echo "文件不存在";
        }
        return $data;
    }

    private function simpleXmlDataToFactoryData($data)
    {
        $restlt = new \stdClass();
        $restlt->FactorySettings = new \stdClass();
        $restlt->FactorySettings->Data = array();
        for ($i = 0; $i < sizeof($data->FactorySettings->Data); $i++) {
            $item = new \stdClass();
            $item->_key = (string)$data->FactorySettings->Data[$i]->attributes()->_key;
            $item->_datatype = (string)$data->FactorySettings->Data[$i]->attributes()->_datatype;
            $item->_data = (string)$data->FactorySettings->Data[$i]->attributes()->_data;
            $item->_save = (string)$data->FactorySettings->Data[$i]->attributes()->_save;
            $restlt->FactorySettings->Data[$i] = $item;
        }

        $restlt->CustomeData = new \stdClass();
        $restlt->CustomeData->Data = array();
        for ($i = 0; $i < sizeof($data->CustomeData->Data); $i++) {
            $item = new \stdClass();
            $item->_key = (string)$data->CustomeData->Data[$i]->attributes()->_key;
            $item->_datatype = (string)$data->CustomeData->Data[$i]->attributes()->_datatype;
            $item->_data = (string)$data->CustomeData->Data[$i]->attributes()->_data;
            $item->_save = (string)$data->CustomeData->Data[$i]->attributes()->_save;
            $restlt->CustomeData->Data[$i] = $item;
        }

        $restlt->DevSta = new \stdClass();
        $restlt->DevSta->Data = array();
        for ($i = 0; $i < sizeof($data->DevSta->Data); $i++) {
            $item = new \stdClass();
            $item->_key = (string)$data->DevSta->Data[$i]->attributes()->_key;
            $item->_datatype = (string)$data->DevSta->Data[$i]->attributes()->_datatype;
            $item->_data = (string)$data->DevSta->Data[$i]->attributes()->_data;
            $item->_save = (string)$data->DevSta->Data[$i]->attributes()->_save;
            $restlt->DevSta->Data[$i] = $item;
        }

        $restlt->CommonSettings = new \stdClass();
        $restlt->CommonSettings->Data = array();
        for ($i = 0; $i < sizeof($data->CommonSettings->Data); $i++) {
            $item = new \stdClass();
            $item->_key = (string)$data->CommonSettings->Data[$i]->attributes()->_key;
            $item->_datatype = (string)$data->CommonSettings->Data[$i]->attributes()->_datatype;
            $item->_data = (string)$data->CommonSettings->Data[$i]->attributes()->_data;
            $item->_save = (string)$data->CommonSettings->Data[$i]->attributes()->_save;
            $restlt->CommonSettings->Data[$i] = $item;
        }
        return $restlt;
    }

    private function arrtoXml($factory)
    {
        $str = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<globaldata>\r\n";

        $str = $str . "\t<FactorySettings>\r\n";
        foreach ($factory->FactorySettings->Data as $value) {
            $str = $str .
                "\t\t<Data _key=\"" . $value->_key .
                "\" _datatype=\"" . $value->_datatype .
                "\" _data=\"" . $this->getDataValue($value) .
                "\" _save=\"" . $this->getSaveValue($value) . "\"/>\r\n";
        }
        $str = $str . "\t</FactorySettings>\r\n";

        $str = $str . "\t<CustomeData>\r\n";
        foreach ($factory->CustomeData->Data as $value) {
            $str = $str .
                "\t\t<Data _key=\"" . $value->_key .
                "\" _datatype=\"" . $value->_datatype .
                "\" _data=\"" . $this->getDataValue($value) .
                "\" _save=\"" . $this->getSaveValue($value) . "\"/>\r\n";
        }
        $str = $str . "\t</CustomeData>\r\n";

        $str = $str . "\t<DevSta>\r\n";
        foreach ($factory->DevSta->Data as $value) {
            $str = $str .
                "\t\t<Data _key=\"" . $value->_key .
                "\" _datatype=\"" . $value->_datatype .
                "\" _data=\"" . $this->getDataValue($value) .
                "\" _save=\"" . $this->getSaveValue($value) . "\"/>\r\n";
        }
        $str = $str . "\t</DevSta>\r\n";

        $str = $str . "\t<CommonSettings>\r\n";
        foreach ($factory->CommonSettings->Data as $value) {
            $str = $str .
                "\t\t<Data _key=\"" . $value->_key .
                "\" _datatype=\"" . $value->_datatype .
                "\" _data=\"" . $this->getDataValue($value) .
                "\" _save=\"" . $this->getSaveValue($value) . "\"/>\r\n";
        }
        $str = $str . "\t</CommonSettings>\r\n";

        $str = $str . "</globaldata>";
        return $str;
    }

    private function getDataValue($_data)
    {
        if (is_bool($_data->_data)) return $_data->_data === true ? "true" : "false";
        return $_data->_data;
    }

    private function getSaveValue($_sava)
    {
        if (is_bool($_sava->_save)) return $_sava->_data === true ? "true" : "false";
        return isset($_sava->_save) ? $_sava->_save : "true";
    }

    private function mergeData($setdata, $defaultdata)
    {
        foreach ($setdata->FactorySettings->Data as $setvalue) {
            foreach ($defaultdata->FactorySettings->Data as $defvalue) {
                if ($setvalue->_key === $defvalue->_key) {
                    $defvalue->_data = $setvalue->_data;
                    break;
                }
            }
        }
        try {
            foreach ($setdata->CustomeData->Data as $setvalue) {
                foreach ($defaultdata->CustomeData->Data as $defvalue) {
                    if ($setvalue->_key === $defvalue->_key) {
                        $defvalue->_data = $setvalue->_data;
                        break;
                    }
                }
            }
        } catch (ErrorException $e) {
        }
        try {
            foreach ($setdata->DevSta->Data as $setvalue) {
                foreach ($defaultdata->DevSta->Data as $defvalue) {
                    if ($setvalue->_key === $defvalue->_key) {
                        $defvalue->_data = $setvalue->_data;
                        break;
                    }
                }
            }
        } catch (ErrorException $e) {
        }
        try {
            foreach ($setdata->CommonSettings->Data as $setvalue) {
                foreach ($defaultdata->CommonSettings->Data as $defvalue) {
                    if ($setvalue->_key === $defvalue->_key) {
                        $defvalue->_data = $setvalue->_data;
                        break;
                    }
                }
            }
        } catch (ErrorException $e) {
        }
        return $defaultdata;
    }
}