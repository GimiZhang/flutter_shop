import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/routers/application.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//首页轮播图
class HomeSwipper extends StatelessWidget {
  final List swiperList;

  HomeSwipper({Key key, this.swiperList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(533),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              if (swiperList[index]['goodsId'] != null) {
                Application.router.navigateTo(
                    context, "/detail?id=${swiperList[index]['goodsId']}");
              }
            },
            child: Image.network(
              "${swiperList[index]['image']}",
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: swiperList.length,
        pagination: new SwiperPagination(), //显示小圆点
        autoplay: true,
      ),
    );
  }
}
