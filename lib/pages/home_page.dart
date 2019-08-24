import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_shop/network/home_api.dart';

import 'home/home_add.dart';
import 'home/home_floor.dart';
import 'home/home_function.dart';
import 'home/home_hot_goods.dart';
import 'home/home_recommend.dart';
import 'home/home_swipper.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  EasyRefreshController _controller;
  ScrollController _scrollController;

  // 反向
  bool _reverse = false;

  // 方向
  Axis _direction = Axis.vertical;
  bool _enableInfiniteLoad = true;

  // 控制结束
  bool _enableControlFinish = false;

  // 任务独立
  bool _taskIndependence = false;

  // 震动
  bool _vibration = true;

  // 是否开启刷新
  bool _enableRefresh = true;

  // 是否开启加载
  bool _enableLoad = true;

  // 顶部回弹
  bool _topBouncing = true;

  // 底部回弹
  bool _bottomBouncing = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = EasyRefreshController(); //刷新控制器
    _scrollController = ScrollController();
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
                HotGoods()
              ],
            ),
            onLoad: () async {
              _controller.finishLoad(noMore: false);
            },
          );
        } else {
          return Center(
            child: Text('加载中.....'),
          );
        }
      },
    );
  }
}
