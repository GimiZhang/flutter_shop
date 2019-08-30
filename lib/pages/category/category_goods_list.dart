import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category_goods_entity.dart';
import '../../network/home_api.dart';
import 'dart:convert';
import 'package:flutter_shop/entity_factory.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  List list = [];

  @override
  void initState() {
    _getGoodsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(880),
      height: ScreenUtil().setHeight(1530),
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return _goodsListItem(index);
          }),
    );
  }

  void _getGoodsList() async {
    await getGoodsList("4", "", 1).then((onValue) {
      var data = json.decode(onValue.toString());
      CategoryGoodsEntity categoryGoodsEntity = EntityFactory.generateOBJ(data);
      setState(() {
        list = categoryGoodsEntity.data;
      });
      print("分类商品列表：》》》》》》》》》${onValue}");
    });
  }

  Widget _goodsListItem(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(880),
        height: ScreenUtil().setHeight(300),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(2)),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Image.network(list[index].image),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(120),bottom: 20),
                  child: Text(
                    list[index].goodsName,
                    style: TextStyle(
                       fontSize: ScreenUtil().setSp(35)),
                  )
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "价格：￥${list[index].presentPrice}",
                      style: TextStyle(
                          color: Colors.pink, fontSize: ScreenUtil().setSp(30)),
                    ),
                    Text(
                      "￥${list[index].oriPrice}",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(30),
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black12),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
