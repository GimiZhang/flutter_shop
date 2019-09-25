import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/entity_factory.dart';
import 'package:flutter_shop/model/product_deatil_entity.dart';
import 'package:flutter_shop/network/home_api.dart';

class DetailInfoProvide with ChangeNotifier {
  ProductDeatilData goodsInfo;
  bool isLeft = true; //默认tabbar左边选中
  bool isRight = false;

  changeTabbarStatus(String changeStatus) {
    if (changeStatus == "left") {
       isLeft = true;
       isRight = false;
    } else {
       isLeft = false; //默认tabbar左边选中
       isRight = true;
    }
    notifyListeners();
  }

  //从后台获取数据
  getGoodsInfo(String goodId) async{
   await getGoodDetail(goodId).then((onValue) {
      var responseData = json.decode(onValue.toString());
      print(responseData);
      ProductDeatilEntity productDeatilEntity =
          EntityFactory.generateOBJ(responseData);
      goodsInfo = productDeatilEntity.data;
      notifyListeners();
    });
  }
}
