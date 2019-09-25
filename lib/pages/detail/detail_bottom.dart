import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/card.dart';
import 'package:flutter_shop/provide/current_index.dart';
import 'package:flutter_shop/provide/good_detail_provide.dart';
import 'package:provide/provide.dart';

class DetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsInfo =
        Provide.value<DetailInfoProvide>(context).goodsInfo.goodInfo;
    var goodsId = goodsInfo.goodsId;
    var goodsName = goodsInfo.goodsName;
    var count = 1;
    var price = goodsInfo.presentPrice;
    var images = goodsInfo.image1;

    return Container(
      width: ScreenUtil().setWidth(1080),
      color: Colors.white,
      height: ScreenUtil().setHeight(120),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Provide.value<CurrentIndexProvide>(context)
                      .changeCurrentIndex(2);
                  Navigator.pop(context);
                },
                child: Container(
                  width: ScreenUtil().setWidth(120),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.pink,
                    size: 30,
                  ),
                ),
              ),
              Provide<CardProvide>(builder: (context, child, val) {
                return Positioned(
                    top: 0,
                    right: -1,
                    child: Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Text(
                        "${Provide.value<CardProvide>(context).allCount}",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ));
              })
            ],
          ),
          InkWell(
            onTap: () async {
              await Provide.value<CardProvide>(context)
                  .save(goodsId, goodsName, count, price, images);
            },
            child: Container(
              color: Colors.green,
              width: ScreenUtil().setWidth(480),
              alignment: Alignment.center,
              height: ScreenUtil().setHeight(150),
              child: Text(
                "加入购物车",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await Provide.value<CardProvide>(context).remove();
            },
            child: Container(
              color: Colors.red,
              width: ScreenUtil().setWidth(480),
              alignment: Alignment.center,
              height: ScreenUtil().setHeight(150),
              child: Text(
                "立即购买",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
