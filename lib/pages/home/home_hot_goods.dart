import 'package:flutter/material.dart';
import 'package:flutter_shop/network/home_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';

class HotGoods extends StatefulWidget {
  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {
  List<Map> hotGoodsList = [];
  int page = 1;

/*  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getHotGoods();
  }*/

  //获取火爆专区数据
  void getHotGoods() {
    getHotBelow().then((val) {
      var data = json.decode(val.toString());
      List<Map> newGoods = (data['data'] as List).cast();
      //设置数据 将请求下来的数据设置到hotGoodsList中
      setState(() {
        hotGoodsList.addAll(newGoods);
        page++; //页码加1
      });
    });
  }

  //创建火爆专区title布局
  Widget hotTitle = Container(
    width: ScreenUtil().setWidth(1080),
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.center,
    child: Text(
      "火爆专区",
      style: TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(30)),
    ),
  );

  //创建list布局
  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      //遍历循环数据列表并转换为widget
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(520),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: 3),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                //图片
                Image.network(val['image']),
                //商品名称
                Text(
                  val['name'],
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: ScreenUtil().setSp(40)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                //商品价格
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("￥${val['mallPrice']}",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(30),
                            color: Colors.black)),
                    Text(
                      "￥${val['price']}",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(30),
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();


      //画流布局
      return Wrap(
        spacing: 2,//2列
        children: listWidget,
      );
    }else{
      //无数据列表
      return Text("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList()
        ],
      ),
    );
  }
}
