import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailExplain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      color: Colors.white,
      alignment: Alignment.centerLeft,
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(120),
      child: Text("说明： > 急速送达 > 正品保证",style: TextStyle(color: Colors.deepOrange,fontSize: ScreenUtil().setSp(45)),),
    );
  }
}
