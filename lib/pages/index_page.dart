import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'car_page.dart';
import 'category_page.dart';
import 'member_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text("分类")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text("购物车")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text("会员中心"))
  ];

  List pageList = [Homepage(), CategoryPage(), CarPage(), MemberPage()];

  int currentIndex = 0;

  var currentPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currentPage = pageList[currentIndex];
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width:2160,height: 1920)..init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("百姓生活+"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(244, 245, 245, 1),
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = pageList[currentIndex];
          });
        },
      ),
      body: pageList[currentIndex],
    );
  }
}
