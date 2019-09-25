import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/card_model_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardProvide extends ChangeNotifier {
  String cardStr = "[]";
  List<CardModelEntity> cardList = [];
  double allPrice = 0;
  int allCount = 0;
  bool allCheckStatus = true;

  //购物车里面添加商品
  save(goodsId, goodsName, count, price, images) async {
    bool isHave = false; //用来标记当前item是否在购物车里添加过
    int index = 0; //初始化索引

    SharedPreferences prefs = await SharedPreferences.getInstance();
    cardStr = prefs.getString("cardInfo");
    allPrice = 0;
    allCount = 0;
    var temp = cardStr == null ? [] : json.decode(cardStr.toString());

    List<Map> tempList = (temp as List).cast();

    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        tempList[index]['count'] = item['count'] + 1;
        cardList[index].count++;
        isHave = true;
      }
      if(item['isCheck']){
        allPrice = (cardList[index].price * cardList[index].count);
        allCount += cardList[index].count;
      }
      index++;
    });


    //如果购物车里面没有当前商品
    if (!isHave) {
      //创建map将当前商品添加到购物车，并保存到本地
      Map<String, dynamic> newGoods = {
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'images': images,
        'isCheck': true
      };
      tempList.add(newGoods);
      cardList.add(CardModelEntity.fromJson(newGoods));

      allPrice = count * price;
      allCount += count;
    }

    cardStr = json.encode(tempList).toString();
    print(cardStr);
    print("数据模型：》》》》》》》" + cardList.toString());
    prefs.setString("cardInfo", cardStr);
    notifyListeners();
  }

  //移除购物车里面的商品
  remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("cardInfo");
    cardList = [];
    print("清除完成----------------");
  }

  //获取购物车里的内容对象
  getCardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cardStr = prefs.getString("cardInfo");
    cardList = [];
    if (cardStr != null) {
      List<Map> tempList = (json.decode(cardStr.toString()) as List).cast();
      allPrice = 0;
      allCount = 0;
      allCheckStatus = true; //初始化选中状态
      tempList.forEach((item) {
        if (item['isCheck']) {
          allPrice += (item['count'] * item['price']);
          allCount += item['count'];
        } else {
          allCheckStatus = false; //设置为未选中
        }
        cardList.add(CardModelEntity.fromJson(item));
      });
    }
    notifyListeners();
  }

  //删除购物车里面的某个商品
  deleteGood(goodsId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cardStr = prefs.getString("cardInfo");

    //定义删除索引
    int tempIndex = 0;
    int deleteIndex = 0;
    List<Map> tempList = (json.decode(cardStr.toString()) as List).cast();
    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        deleteIndex = tempIndex;
      }
      tempIndex++;
    });

    tempList.removeAt(deleteIndex);
    //刷新本地数据
    cardStr = json.encode(tempList).toString();
    prefs.setString("cardInfo", cardStr);

    getCardInfo(); //调取购物车商品 默认有发通知
  }

  //购物车选中状态改变
  checkStatus(CardModelEntity item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cardStr = prefs.getString("cardInfo");
    List<Map> tempList = (json.decode(cardStr.toString()) as List).cast();

    for (int i = 0; i < tempList.length; i++) {
      if (item.goodsId == tempList[i]['goodsId']) {
        tempList[i]['isCheck'] = item.isCheck;
      }
    }

    cardStr = json.encode(tempList).toString();
    prefs.setString("cardInfo", cardStr);

    getCardInfo();
  }


  //全选
  checkAllStatus(bool isCheck) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cardStr = prefs.getString("cardInfo");
    List<Map> tempList = (json.decode(cardStr.toString()) as List).cast();
    allCheckStatus = isCheck;
    for (int i = 0; i < tempList.length; i++) {
      tempList[i]['isCheck'] = isCheck;
    }
    cardStr = json.encode(tempList).toString();
    prefs.setString("cardInfo", cardStr);
    getCardInfo();
  }


  //增加减少购物车里商品数量 todoStatus操作状态  1加或者2减
  addReduceCardNum(CardModelEntity item,int todoStatus) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    cardStr = prefs.getString("cardInfo");
    List<Map> tempList = (json.decode(cardStr.toString()) as List).cast();

    if(todoStatus == 1){
      for (int i = 0; i < tempList.length; i++) {
        if (item.goodsId == tempList[i]['goodsId']) {
          tempList[i]['count']++;
        }
      }
    }else{
      for (int i = 0; i < tempList.length; i++) {
        if (item.goodsId == tempList[i]['goodsId']) {
          tempList[i]['count']--;
        }
      }
    }

    cardStr = json.encode(tempList).toString();
    prefs.setString("cardInfo", cardStr);
    getCardInfo();

  }

}
