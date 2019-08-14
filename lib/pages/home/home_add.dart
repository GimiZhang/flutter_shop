import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//广告组件
class HomeAdd extends StatelessWidget {

  String addPicture;

  HomeAdd({Key key,this.addPicture}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(addPicture),
    );
  }
}

//拨打电话
class HomePhone extends StatelessWidget {

  String leaderImage;
  String leaderPhone;

  HomePhone({Key key,this.leaderPhone,this.leaderImage}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _callPhone,
      child: Container(
        child: Image.network(leaderImage),
      ),
    );
  }

  void _callPhone() async{
    var phoneNum = "tel:"+leaderPhone;

    if(await canLaunch(phoneNum)){
      await launch(phoneNum);
    }else{
      print("url异常");
    }

  }
}

