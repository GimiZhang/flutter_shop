import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/current_index.dart';
import 'package:provide/provide.dart';

import 'car_page.dart';
import 'category_page.dart';
import 'home_page.dart';
import 'member_page.dart';

// ignore: must_be_immutable
class IndexPage extends StatelessWidget {

  List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text("分类")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text("购物车")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text("会员中心"))
  ];

  List<Widget> pageList = [Homepage(), CategoryPage(), CarPage(), MemberPage()];

  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920)..init(context);
    return Provide<CurrentIndexProvide>(builder: (context, child, val) {

      currentIndex = Provide.value<CurrentIndexProvide>(context).currentIndex;

      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(244, 245, 245, 1),
          items: bottomTabs,
          onTap: (index) {
            Provide.value<CurrentIndexProvide>(context)
                .changeCurrentIndex(index);
          },
        ),
        body: IndexedStack(
          index: currentIndex,
          children: pageList,
        ),
      );
    });
  }
}

//class IndexPage extends StatefulWidget {
//  IndexPage({Key key}) : super(key: key);
//
//  _IndexPageState createState() => _IndexPageState();
//}
//
//class _IndexPageState extends State<IndexPage> with AutomaticKeepAliveClientMixin{
//  List<BottomNavigationBarItem> bottomTabs = [
//    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
//    BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.search), title: Text("分类")),
//    BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.shopping_cart), title: Text("购物车")),
//    BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.profile_circled), title: Text("会员中心"))
//  ];
//
//  List<Widget> pageList = [Homepage(), CategoryPage(), CarPage(), MemberPage()];
//
//  int currentIndex = 0;
//
//  var currentPage;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//
//    currentPage = pageList[currentIndex];
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    ScreenUtil.instance = ScreenUtil(width:1080,height: 1920)..init(context);
//
//    return Scaffold(
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: currentIndex,
//        type: BottomNavigationBarType.fixed,
//        backgroundColor: Color.fromRGBO(244, 245, 245, 1),
//        items: bottomTabs,
//        onTap: (index) {
//          setState(() {
//            currentIndex = index;
//            currentPage = pageList[currentIndex];
//          });
//        },
//      ),
//      body: IndexedStack(
//        index: currentIndex,
//        children: pageList,
//      ),
//    );
//  }
//
//  //切换tab 保持页面状态
//  @override
//  bool get wantKeepAlive => true;
//}
