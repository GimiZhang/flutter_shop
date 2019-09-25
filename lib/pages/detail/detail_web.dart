import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/provide/good_detail_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsDetail = Provide.value<DetailInfoProvide>(context)
        .goodsInfo
        .goodInfo
        .goodsDetail;

    return Provide<DetailInfoProvide>(builder: (context, child, val) {
      var isLeft = Provide.value<DetailInfoProvide>(context).isLeft;
      if (isLeft) {
        return Container(
            child: Html(
          data: goodsDetail,
        ));
      } else {
        return Container(
          width: ScreenUtil().setWidth(1080),
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text("暂无评论"),
        );
      }
    });
  }
}
