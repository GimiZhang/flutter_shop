import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/card_model_entity.dart';
import 'package:provide/provide.dart';
import 'card_count.dart';
import 'package:flutter_shop/provide/card.dart';

class CardItem extends StatelessWidget {
  CardModelEntity item;

  CardItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300),
      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Row(
        children: <Widget>[
          _checkedProduct(context,item),
          _productImg(item),
          _goodTitle(item),
          _goodPrice(context,item)
        ],
      ),
    );
  }

  //checkbox选中组件

  Widget _checkedProduct(context,item) {
    return Container(
      width: ScreenUtil().setWidth(60),
      child: Checkbox(
        value: item.isCheck,
        onChanged: (val) {
          item.isCheck = val;
          Provide.value<CardProvide>(context).checkStatus(item);
        },
        activeColor: Colors.pink,
      ),
    );
  }

  //商品图片
  Widget _productImg(item) {
    return Container(
      width: ScreenUtil().setWidth(200),
      margin: EdgeInsets.only(left: 5),
      padding: EdgeInsets.all(3),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black26)),
      child: Image.network(item.images),
    );
  }

  //产品名称
  Widget _goodTitle(item) {
    return Container(
      width: ScreenUtil().setWidth(600),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Text(item.goodsName), CardCount(item)],
      ),
    );
  }

  //商品价格
  Widget _goodPrice(context,item) {
    return Container(
      width: ScreenUtil().setWidth(180),
      height: ScreenUtil().setHeight(300),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("￥${item.price}"),
          InkWell(
            onTap: (){
              Provide.value<CardProvide>(context).deleteGood(item.goodsId);
            },
            child: Icon(
              Icons.delete_forever,
              color: Colors.black26,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
