import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/service/service_method.dart';


//获取首页数据内容
Future getHomePageContent(){
  Map<Object,Object> paramsMap = {
    "lon":"115.02932",
    "lat":"35.76189"
  };
  return request(servicePath['homePageContent'], params: paramsMap);
}


//获取火爆专区数据
Future getHotBelow(){
  Map<Object,Object> paramsMap = {
    "page":1,
  };
  return request(servicePath['homePageBelowConten'], params: paramsMap);
}