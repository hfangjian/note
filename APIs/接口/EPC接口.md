### 1. 通过vin码获取相关信息
URL： http://localhost:20080/ctg_coffee/nissan/get_attrvalue_by_vin.do
请求参数：vin -- 　vin码，字符串
```javascript
//例：请求成功时的返回示例：
{
    "vininfo":{
        "id": 12,   　
        "vin": "1N4AA51E09C809735", 　//vin码
        "produceDate": null,
        "modelCode": "A35",     //车型代码
        "model": "BLJALFZA35EJAC----",
        "color": "K12",     //车辆颜色
        "internalColor": "K", //内部颜色
        "mark": 2,
        "originalDate": 1185811200000, 　//　生产日期（时间戳）
        "carBody": "MAXIMA" //车身
    },
    "attr":{    //车型控件属性（最多会有8个）
        "AREA": "MEXICO",
        "ENGINE": "VQ35DE",
        "GRADE": "35SV",
        "TRANS": "CVT",
        "BODY": "4S"
    }
}