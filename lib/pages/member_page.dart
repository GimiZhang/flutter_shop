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
        children: <Widget>[_topHeader()],
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
}
