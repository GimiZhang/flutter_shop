import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/card.dart';
import 'package:provide/provide.dart';

class CardBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<CardProvide>(builder: (context, child, val) {
      return Container(
        height: ScreenUtil().setHeight(140),
        width: ScreenUtil().setWidth(1080),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            _selectAll(context),
            totalAndSend(context),
            submitFee(context)
          ],
        ),
      );
    });
  }

  //全选
  Widget _selectAll(context) {
    bool allCheckStatus = Provide.value<CardProvide>(context).allCheckStatus;
    return Container(
      width: ScreenUtil().setWidth(230),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Checkbox(
            value: allCheckStatus,
            onChanged: (bool val) {
              Provide.value<CardProvide>(context).checkAllStatus(val);
            },
            activeColor: Colors.pink,
          ),
          Text(
            "全选",
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  //合计
  Widget totalFee(context) {
    double allPrice = Provide.value<CardProvide>(context).allPrice;
    return Container(
      width: ScreenUtil().setWidth(590),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "合计：",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "￥${allPrice}",
            style: TextStyle(fontSize: 13, color: Colors.pink),
          )
        ],
      ),
    );
  }

  //配送费
  Widget sendFee() {
    return Container(
      width: ScreenUtil().setWidth(590),
      margin: EdgeInsets.only(top: 5),
      alignment: Alignment.centerRight,
      child: Text(
        "满10元免配送费,预购免配送费",
        style: TextStyle(fontSize: 8),
      ),
    );
  }

  //合计and配送费
  Widget totalAndSend(context) {
    return Container(
      width: ScreenUtil().setWidth(630),
      height: ScreenUtil().setHeight(140),
      padding: EdgeInsets.only(right: 20),
      margin: EdgeInsets.only(top: 15),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[totalFee(context), sendFee()],
      ),
    );
  }

  //结算
  Widget submitFee(context) {
    int allCount = Provide.value<CardProvide>(context).allCount;
    return Container(
      width: ScreenUtil().setWidth(160),
      height: ScreenUtil().setHeight(95),
      padding: EdgeInsets.all(3),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Text(
        "结算（${allCount}）",
        style: TextStyle(fontSize: 12, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
