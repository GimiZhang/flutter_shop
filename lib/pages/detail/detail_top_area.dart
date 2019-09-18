import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/good_detail_provide.dart';
import 'package:provide/provide.dart';


class DetailTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailInfoProvide>(
      builder: (context,child,val){
        var goodInfo = Provide.value<DetailInfoProvide>(context).goodsInfo.goodInfo;
        if(goodInfo != null){
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _getImage(goodInfo.comPic),
                _getGoodName(goodInfo.goodsName),
                _getGoodNum(goodInfo.goodsSerialNumber),
                _getGoodPrice(goodInfo.oriPrice.toString(),goodInfo.presentPrice.toString()),

              ],
            ),
          );
        }else{
          return Text("正在加载中.......");
        }
      },
    );
  }

  //图片
  Widget _getImage(String url) {
    return Image.network(url, width: ScreenUtil().setWidth(1080),);
  }

  //商品名称
  Widget _getGoodName(String name){
    return Container(
      padding: EdgeInsets.only(left: 15),
      width: ScreenUtil().setWidth(1080),
      child: Text(name,style: TextStyle(
        fontSize: ScreenUtil().setSp(60)
      ),),
    );
  }

  //商品编号
  Widget _getGoodNum(String goodNo){
    return Container(
      width: ScreenUtil().setWidth(1080),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 8),
      child: Text("编号："+goodNo,style: TextStyle(
        color: Colors.black12
      ),),
    );
  }


  //商品价格
  Widget _getGoodPrice(String activePrice,String shopPrice){
    return Container(
      width: ScreenUtil().setWidth(1080),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 8,bottom: 8),
      child: Row(
        children: <Widget>[
          Text("￥"+activePrice,style: TextStyle(
            fontSize: ScreenUtil().setSp(50),
            color: Colors.deepOrange
          ),),
          SizedBox(width: 40,),
          Text("市场价："),
          Text("￥"+shopPrice,style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.black12
          ),)
        ],
      ),
    );
  }


}
