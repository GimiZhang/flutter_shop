import 'package:flutter/material.dart';
import 'package:flutter_shop/service/service_method.dart';

class HotGoods extends StatefulWidget {
  @override
  _HotGoodsState createState() => _HotGoodsState();
}



class _HotGoodsState extends State<HotGoods> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBelowConten().then((val){
      print(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("火爆专区"),);
  }
}
