import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import '../provide/card.dart';
import 'card/card_bottom.dart';
import 'card/card_item.dart';

class CarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: FutureBuilder(
          future: _getCardInfo(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List cardList = Provide.value<CardProvide>(context).cardList;

              return Stack(
                children: <Widget>[
                  Provide<CardProvide>(builder: (context, child, val) {
                    cardList =
                        Provide.value<CardProvide>(context).cardList;
                    return ListView.builder(
                        itemCount: cardList.length,
                        itemBuilder: (context, index) {
                          return CardItem(cardList[index]);
                        });
                  }),
                  Positioned(
                    child: CardBottom(),
                    bottom: 0,
                  )
                ],
              );
            } else {
              return Text("暂无数据");
            }
          }),
    );
  }

  //获取本地添加到购物车的物品
  Future<String> _getCardInfo(BuildContext context) async {
    await Provide.value<CardProvide>(context).getCardInfo();
    return "ok";
  }
}
