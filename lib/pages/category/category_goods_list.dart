import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/entity_factory.dart';
import 'package:flutter_shop/model/category_goods_entity.dart';
import 'package:flutter_shop/provide/categroy_goods_list_provide.dart';
import 'package:flutter_shop/utils/format_utils.dart';
import 'package:provide/provide.dart';

import '../../network/home_api.dart';

class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
//  List list = [];

  EasyRefreshController _controller;

  // 反向
  bool _reverse = false;

  // 方向
  Axis _direction = Axis.vertical;

  // Header浮动
  bool _headerFloat = false;

  // 无限加载
  bool _enableInfiniteLoad = true;

  // 控制结束
  bool _enableControlFinish = false;

  // 任务独立
  bool _taskIndependence = false;

  // 震动
  bool _vibration = true;

  // 是否开启刷新
  bool _enableRefresh = true;

  // 顶部回弹
  bool _topBouncing = true;

  // 底部回弹
  bool _bottomBouncing = true;

  DateTime dateTime = new DateTime.now();

  @override
  void initState() {
    _controller = EasyRefreshController(); //刷新控制器
    _getGoodsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvider>(
        builder: (context, child, catogoryGoodsList) {
      return Expanded(
          child: Container(
        width: ScreenUtil().setWidth(880),
        child: EasyRefresh(
          emptyWidget: catogoryGoodsList.categoryGoods.length == 0
              ? Container(
                  alignment: Alignment.center,
                  width: ScreenUtil().setWidth(880),
                  height: ScreenUtil().setHeight(1200),
                  child: Text("暂无数据"),
                )
              : null,
          enableControlFinishLoad: true,
          enableControlFinishRefresh: true,
          controller: _controller,
          taskIndependence: _taskIndependence,
          header: ClassicalHeader(
            enableInfiniteRefresh: false,
            refreshText: "下拉刷新",
            refreshReadyText: "松开刷新",
            refreshingText: "刷新中...",
            refreshedText: "刷新完成",
            refreshFailedText: "刷新失败",
            noMoreText: "暂无数据",
            infoText: "更新于" + formatDate(dateTime, [hh, ":", mm]),
            infoColor: Colors.pink,
            float: _headerFloat,
            enableHapticFeedback: _vibration,
          ),
          footer: ClassicalFooter(
            enableInfiniteLoad: _enableInfiniteLoad,
            loadText: "上拉加载",
            loadReadyText: "松手加载",
            loadingText: "加载中",
            loadedText: "加载完成",
            loadFailedText: "加载失败",
            noMoreText: "没有更多数据了",
            infoText: "更新于" + formatDate(dateTime, [hh, ":", mm]),
            infoColor: Colors.pink,
            enableHapticFeedback: _vibration,
          ),
          child: ListView.builder(
              itemCount: catogoryGoodsList.categoryGoods.length,
              itemBuilder: (context, index) {
                return _goodsListItem(catogoryGoodsList.categoryGoods, index);
              }),
          onLoad: Provide.value<CategoryGoodsListProvider>(context).enableLoad
              ? () async {
                  _getGoodsList();
                }
              : null,
          onRefresh: _enableRefresh
              ? () async {
                  Provide.value<CategoryGoodsListProvider>(context).page = 1;
                  _getGoodsList();
                }
              : null,
        ),
      ));
    });
  }

  void _getGoodsList() async {
    print("参数1：=====" +
        Provide.value<CategoryGoodsListProvider>(context).categoryId +
        "--------" +
        Provide.value<CategoryGoodsListProvider>(context).categorySubId +
        "----" +
        Provide.value<CategoryGoodsListProvider>(context).page.toString());
    await getGoodsList(
            Provide.value<CategoryGoodsListProvider>(context).categoryId,
            Provide.value<CategoryGoodsListProvider>(context).categorySubId,
            Provide.value<CategoryGoodsListProvider>(context).page)
        .then((onValue) {
      var data = json.decode(onValue.toString());
      CategoryGoodsEntity categoryGoodsEntity = EntityFactory.generateOBJ(data);
      if (categoryGoodsEntity.data.length >= 20) {
        setState(() {
          Provide.value<CategoryGoodsListProvider>(context)
              .getCategoryGoodsList(categoryGoodsEntity.data);
          if (Provide.value<CategoryGoodsListProvider>(context).page == 1) {
            _controller.resetLoadState();
            _controller.finishRefresh();
          } else {
            _controller.resetLoadState();
            _controller.finishLoad(
                noMore: !Provide.value<CategoryGoodsListProvider>(context)
                    .enableLoad);
          }
          Provide.value<CategoryGoodsListProvider>(context).addPage();
        });
      } else {
        Provide.value<CategoryGoodsListProvider>(context).enableLoad = false;
        setState(() {
          Provide.value<CategoryGoodsListProvider>(context)
              .getCategoryGoodsList(categoryGoodsEntity.data);
          if (Provide.value<CategoryGoodsListProvider>(context).page == 1) {
            _controller.resetLoadState();
            _controller.finishRefresh();
          } else {
            _controller.resetLoadState();
            _controller.finishLoad(
                noMore: !Provide.value<CategoryGoodsListProvider>(context)
                    .enableLoad);
          }
        });
      }

      print("分类商品列表：》》》》》》》》》${onValue}");
    });
  }

  Widget _goodsListItem(List newList, int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil().setWidth(880),
        height: ScreenUtil().setHeight(300),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(2)),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(270),
              height: ScreenUtil().setHeight(300),
              child: Image.network(newList[index].image),
            ),
            Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(610),
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(120), bottom: 20),
                      width: ScreenUtil().setWidth(520),
                      alignment: Alignment.center,
                      child: Text(
                        newList[index].goodsName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: ScreenUtil().setSp(35)),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "价格：￥${newList[index].presentPrice}",
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: ScreenUtil().setSp(30)),
                      ),
                      Text(
                        "￥${newList[index].oriPrice}",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(30),
                            decoration: TextDecoration.lineThrough,
                            color: Colors.black12),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
