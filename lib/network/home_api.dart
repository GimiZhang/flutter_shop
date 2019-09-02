import 'package:flutter_shop/config/service_url.dart';
import 'package:flutter_shop/service/service_method.dart';

//获取首页数据内容
Future getHomePageContent() {
  Map<Object, Object> paramsMap = {"lon": "115.02932", "lat": "35.76189"};
  return requestPost(servicePath['homePageContent'], params: paramsMap);
}

//获取火爆专区数据
Future getHotBelow(int page) {
  Map<Object, Object> paramsMap = {
    "page": page,
  };
  return requestPost(servicePath['homePageBelowConten'], params: paramsMap);
}

//分类数据获取
Future getCategory() {
  return requestPost(servicePath['getCategory']);
}

//获取分类列表数据
Future getGoodsList(String categoryId, String categorySubId, int page) {
  Map<Object, Object> paramsMap = {
    "page": page,
    "categoryId": categoryId == null ? "4" : categoryId,
    "categorySubId": categorySubId == null ? "" : categorySubId,
  };
  print(paramsMap.toString());
  return requestPost(servicePath['getMallGoods'], params: paramsMap);
}
