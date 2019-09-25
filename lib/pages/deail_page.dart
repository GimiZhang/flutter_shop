import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provide/good_detail_provide.dart';
import 'detail/detail_top_area.dart';
import 'detail/detail_explain.dart';
import 'detail/detail_tabbar.dart';
import 'detail/detail_web.dart';
import 'detail/detail_bottom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  final String goodId;

  DetailPage(this.goodId);

  @override
  Widget build(BuildContext context) {
    _getGoodsInfo(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); //返回上一个页面
            }),
        title: Text("商品详情页"),
      ),
      body: FutureBuilder(
          future: _getGoodsInfo(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(120)),
                    child: ListView(
                      children: <Widget>[
                        DetailTopArea(),
                        DetailExplain(),
                        DetailTabbar(),
                        DetailWeb(),
                      ],
                    ),
                  ),
                  Positioned(
                      left: 0,
                      bottom: 0,
                      child: DetailBottom()
                  )
                ],
              );

            } else {
              return Container(
                alignment: Alignment.center,
                child: Text("加载中......"),
              );
            }
          }),
    );
  }

  Future _getGoodsInfo(BuildContext context) async {
    await Provide.value<DetailInfoProvide>(context).getGoodsInfo(goodId);
    print("加载完成");
    return Text("完成");
  }
}
