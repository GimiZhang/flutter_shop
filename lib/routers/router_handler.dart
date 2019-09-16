import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/pages/deail_page.dart';

Handler detailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> paramsMap) {
  String goodsId = paramsMap['id'].first;
  print("goodsId is ${goodsId}");
  return DetailPage(goodsId);
});
