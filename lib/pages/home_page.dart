import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/network/home_api.dart';

import 'home/home_add.dart';
import 'home/home_floor.dart';
import 'home/home_function.dart';
import 'home/home_recommend.dart';
import 'home/home_swipper.dart';
import 'package:flutter_shop/routers/application.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map> hotGoodsList = [];
  int page = 1;

  EasyRefreshController _controller;

  // 任务独立
  bool _taskIndependence = false;

  // 是否开启加载
  bool _enableLoad = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = EasyRefreshController(); //刷新控制器
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getHomePageContent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = json.decode(snapshot.data.toString());
          List<Map> swiper = (data['data']['slides'] as List).cast();
          List<Map> functionList = (data['data']['category'] as List).cast();
          String addPicture =
              data['data']['advertesPicture']['PICTURE_ADDRESS'];
          String leaderImage = data['data']['shopInfo']['leaderImage'];
          String leaderPhone = data['data']['shopInfo']['leaderPhone'];
          List<Map> recommendList = (data['data']['recommend'] as List).cast();
          String floorTitle1 = data['data']['floor1Pic']['PICTURE_ADDRESS'];
          String floorTitle2 = data['data']['floor2Pic']['PICTURE_ADDRESS'];
          String floorTitle3 = data['data']['floor3Pic']['PICTURE_ADDRESS'];
          List<Map> floor1 = (data['data']['floor1'] as List).cast();
          List<Map> floor2 = (data['data']['floor2'] as List).cast();
          List<Map> floor3 = (data['data']['floor3'] as List).cast();
          return EasyRefresh(
            enableControlFinishLoad: true,
            enableControlFinishRefresh: true,
            controller: _controller,
            taskIndependence: _taskIndependence,
            footer: MaterialFooter(),
//            footer: ClassicalFooter(
//                loadedText: "上拉加载",
//                loadReadyText: "松开加载",
//                loadingText: "加载中...",
//                loadFailedText: "加载失败",
//                noMoreText: "没有更多数据了",
//                infoText: "请稍等",
//                enableInfiniteLoad: true),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 24,
                ),
                HomeSwipper(
                  swiperList: swiper,
                ),
                HomeFuction(
                  functionList: functionList,
                ),
                HomeAdd(
                  addPicture: addPicture,
                ),
                HomePhone(
                  leaderPhone: leaderPhone,
                  leaderImage: leaderImage,
                ),
                HomeRecommend(
                  recommendList: recommendList,
                ),
                FloorTitle(
                  floor_address: floorTitle1,
                ),
                FloorItem(
                  floorGoodsList: floor1,
                ),
                FloorTitle(
                  floor_address: floorTitle2,
                ),
                FloorItem(
                  floorGoodsList: floor2,
                ),
                FloorTitle(
                  floor_address: floorTitle3,
                ),
                FloorItem(
                  floorGoodsList: floor3,
                ),
                _hotGoods()
              ],
            ),
            onLoad: _enableLoad
                ? () async {
                    getHotGoods();
                  }
                : null,
          );
        } else {
          return Center(
            child: Text('加载中.....'),
          );
        }
      },
    );
  }

  //火爆专区
  Widget _hotGoods() {
    return Container(
      child: Column(
        children: <Widget>[hotTitle, _wrapList()],
      ),
    );
  }

  //获取火爆专区数据
  void getHotGoods() {
    getHotBelow(page).then((val) {
      var data = json.decode(val.toString());
      List<Map> newGoods = (data['data'] as List).cast();
      if (newGoods.length >= 20) {
//        设置数据 将请求下来的数据设置到hotGoodsList中
        setState(() {
          hotGoodsList.addAll(newGoods);
          page++; //页码加1
        });
      } else {
        _enableLoad = false;
        setState(() {
          hotGoodsList.addAll(newGoods);
        });
      }

      _controller.finishLoad(noMore: !_enableLoad);
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
          onTap: () {
            Application.router
                .navigateTo(context, "/detail?id=${val['goodsId']}");
          },
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
        spacing: 2, //控件之间间距
        children: listWidget,
      );
    } else {
      //无数据列表
      return Text("");
    }
  }
}
