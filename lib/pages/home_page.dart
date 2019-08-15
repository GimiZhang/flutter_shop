import 'package:flutter/material.dart';
import 'home/home_swipper.dart';
import '../service/service_method.dart';
import 'dart:convert';
import 'home/home_function.dart';
import 'home/home_add.dart';
import 'home/home_recommend.dart';

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
        builder: (context,snapshot){
          if(snapshot.hasData){
            var data = json.decode(snapshot.data.toString());
            List<Map> swiper = (data['data']['slides'] as List).cast();
            List<Map> functionList = (data['data']['category'] as List).cast();
            String addPicture = data['data']['advertesPicture']['PICTURE_ADDRESS'];
            String leaderImage = data['data']['shopInfo']['leaderImage'];
            String leaderPhone = data['data']['shopInfo']['leaderPhone'];
            List<Map> recommendList = (data['data']['recommend'] as List).cast();
            return Column(
              children: <Widget>[
                HomeSwipper(swiperList: swiper,),
                HomeFuction(functionList:functionList,),
                HomeAdd(addPicture: addPicture,),
                HomePhone(leaderPhone: leaderPhone,leaderImage: leaderImage,),
                HomeRecommend(recommendList: recommendList,)
              ],
            );
          }else{
            return Center(
              child: Text('加载中.....'),
            );
          }
        },
      ),
    );
  }
}
