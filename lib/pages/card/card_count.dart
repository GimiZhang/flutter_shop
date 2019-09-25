import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/card_model_entity.dart';
import 'package:flutter_shop/provide/card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';

class CardCount extends StatelessWidget {
  CardModelEntity item;

  CardCount(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(220),
      margin: EdgeInsets.only(top: 10),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Row(
        children: <Widget>[
          _reduceCount(context),
          _countArea(),
          _addCount(context)
        ],
      ),
    );
  }

  //减少按钮
  Widget _reduceCount(context) {
    return InkWell(
      onTap: () {
        if (item.count == 1) {
          Fluttertoast.showToast(msg: "已经最少了");
        } else {
          Provide.value<CardProvide>(context).addReduceCardNum(item, 2);
        }
      },
      child: Container(
        width: ScreenUtil().setWidth(65),
        height: ScreenUtil().setHeight(65),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(right: BorderSide(width: 1, color: Colors.black12))),
        child: Text('-',style: TextStyle(fontSize: 13),),
      ),
    );
  }

  //增加按钮
  Widget _addCount(context) {
    return InkWell(
      onTap: () {
        Provide.value<CardProvide>(context).addReduceCardNum(item, 1);
      },
      child: Container(
        width: ScreenUtil().setWidth(65),
        height: ScreenUtil().setHeight(65),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(left: BorderSide(width: 1, color: Colors.black12))),
        child: Text('+',style: TextStyle(fontSize: 13)),
      ),
    );
  }

  //数量显示区域
  Widget _countArea() {
    return Container(
      width: ScreenUtil().setWidth(75),
      height: ScreenUtil().setHeight(65),
      color: Colors.white,
      alignment: Alignment.center,
      child: Text('${item.count}'),
    );
  }
}
