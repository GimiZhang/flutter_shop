import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/good_detail_provide.dart';
import 'package:provide/provide.dart';

// 详情页面tabbar
class DetailTabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailInfoProvide>(
      builder: (context, child, val) {
        bool isLeft = Provide.value<DetailInfoProvide>(context).isLeft;
        bool isRight = Provide.value<DetailInfoProvide>(context).isRight;
        return Container(
          margin: EdgeInsets.only(top: 8),
          child: Row(
            children: <Widget>[
              tabbarLeft(context, isLeft),
              tabbarRight(context, isRight)
            ],
          ),
        );
      },
    );
  }

  Widget tabbarLeft(BuildContext context, bool isLeft) {
    return InkWell(
        onTap: () {
          Provide.value<DetailInfoProvide>(context).changeTabbarStatus("left");
        },
        child: Container(
          width: ScreenUtil().setWidth(540),
          height: ScreenUtil().setHeight(100),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: isLeft ? Colors.pink : Colors.black12))),
          child: Text(
            "详情",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(50),
                color: isLeft ? Colors.pink : Colors.black),
          ),
        ));
  }

  Widget tabbarRight(BuildContext context, bool isRight) {
    return InkWell(
        onTap: () {
          Provide.value<DetailInfoProvide>(context).changeTabbarStatus("right");
        },
        child: Container(
          width: ScreenUtil().setWidth(540),
          height: ScreenUtil().setHeight(100),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      width: 1,
                      color: isRight ? Colors.pink : Colors.black12))),
          child: Text(
            "评论",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(50),
                color: isRight ? Colors.pink : Colors.black),
          ),
        ));
  }
}
