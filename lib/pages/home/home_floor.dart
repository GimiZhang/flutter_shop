import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FloorTitle extends StatelessWidget {
  
  String floor_address;
  
  FloorTitle({Key key,this.floor_address}):super(key:key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Image.network(floor_address),
    );
  }
  
}

class FloorItem extends StatelessWidget {

  List floorGoodsList;

  FloorItem({Key key,this.floorGoodsList}):super(key:key);

  Widget _getFirstWidget(){
      return Row(
        children: <Widget>[
         _getItem(floorGoodsList[0]),
          Column(
            children: <Widget>[
              _getItem(floorGoodsList[1]),
              _getItem(floorGoodsList[2])
            ],
          )
        ],
      );
  }

  Widget _getSecond(){
    return Row(
      children: <Widget>[
        _getItem(floorGoodsList[3]),
        _getItem(floorGoodsList[4])
      ],
    );
  }

  Widget _getItem(Map goods){
    return Container(
      width: ScreenUtil().setWidth(540),
      child: InkWell(
        onTap: (){},
        child: Image.network(goods['image']),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _getFirstWidget(),
        _getSecond()
      ],
    );
  }
}


