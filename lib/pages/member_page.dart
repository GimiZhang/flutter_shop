import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("会员中心"),
      ),
      body: ListView(
        children: <Widget>[
          _topHeader(),
          _orderTitle(),
          _orderList(),
          _actionsList()
        ],
      ),
    );
  }

  Widget _topHeader() {
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: 220,
      color: Colors.pinkAccent,
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: ClipOval(
              child: Image.network(
                "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=998091442,994746716&fm=26&gp=0.jpg",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "海贼王的男人",
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }

  Widget _orderTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text("我的订单"),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }

  Widget _orderList() {
    return Container(
      height: ScreenUtil().setHeight(240),
      alignment: Alignment.center,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(260),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.monetization_on),
                SizedBox(
                  height: 10,
                ),
                Text('待付款')
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(260),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.send),
                SizedBox(
                  height: 10,
                ),
                Text('待发货')
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(260),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.directions_car),
                SizedBox(
                  height: 10,
                ),
                Text('待收货')
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(260),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.comment),
                SizedBox(
                  height: 10,
                ),
                Text('待评价')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _list(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }

  Widget _actionsList() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _list(Icons.favorite_border, "领取优惠券"),
          _list(Icons.favorite, "已领取优惠券"),
          _list(Icons.location_on, "地址管理"),
          SizedBox(
            height: 10,
          ),
          _list(Icons.contact_phone, "客服电话"),
          _list(Icons.store, "关于商城"),
        ],
      ),
    );
  }
}
