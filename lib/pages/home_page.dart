import 'package:flutter/material.dart';
import 'home/home_swipper.dart';
import '../service/service_method.dart';
import 'dart:convert';
import 'home/home_function.dart';
import 'home/home_add.dart';
import 'home/home_recommend.dart';
import 'home/home_floor.dart';
import 'home/home_hot_goods.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
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
            List<Map> recommendList =
                (data['data']['recommend'] as List).cast();
            String floorTitle1 = data['data']['floor1Pic']['PICTURE_ADDRESS'];
            String floorTitle2 = data['data']['floor2Pic']['PICTURE_ADDRESS'];
            String floorTitle3 = data['data']['floor3Pic']['PICTURE_ADDRESS'];
            List<Map> floor1 = (data['data']['floor1'] as List).cast();
            List<Map> floor2 = (data['data']['floor2'] as List).cast();
            List<Map> floor3 = (data['data']['floor3'] as List).cast();
            return Column(
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
            );
          } else {
            return Center(
              child: Text('加载中.....'),
            );
          }
        },
      ),
    );
  }
}
