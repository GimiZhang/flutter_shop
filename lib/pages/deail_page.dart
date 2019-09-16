import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  String goodsId;
  DetailPage(this.goodsId);


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Text("商品id：${goodsId}"),
    );
  }
}
