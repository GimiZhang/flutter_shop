import 'package:flutter/material.dart';
import 'package:flutter_shop/model/product_deatil_entity.dart';
import 'package:flutter_shop/network/home_api.dart';
import 'dart:convert';
import 'package:flutter_shop/entity_factory.dart';

class DetailInfoProvide with ChangeNotifier {
  ProductDeatilData goodsInfo;

  //从后台获取数据
  getGoodsInfo(String goodId) {
    getGoodDetail(goodId).then((onValue) {
      var responseData = json.decode(onValue.toString());
      print(responseData);
      ProductDeatilEntity productDeatilEntity =
          EntityFactory.generateOBJ(responseData);
      goodsInfo = productDeatilEntity.data;
      notifyListeners();
    });
  }
}
