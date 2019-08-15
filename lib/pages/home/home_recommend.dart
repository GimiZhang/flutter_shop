import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//商品推荐
class HomeRecommend extends StatelessWidget {
 final List recommendList;

  HomeRecommend({Key key, this.recommendList}) : super(key: key);

  //商品标题
  Widget _recommendTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      height: ScreenUtil.getInstance().setHeight(80),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Text(
        "商品推荐",
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  //商品推荐item
  Widget _recommendItem(BuildContext context, int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil.getInstance().setHeight(350),
        width: ScreenUtil.getInstance().setWidth(1080/3),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(left: BorderSide(width: 1, color: Colors.black12))),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text(
              '￥${recommendList[index]['price']}',
              style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.black12),
            )
          ],
        ),
      ),
    );
  }

  Widget _recommendList() {
    return Container(
      height: ScreenUtil.getInstance().setHeight(420),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (context, index) {
            return _recommendItem(context, index);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(520),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          //商品推荐标题
          _recommendTitle(),
          _recommendList()
        ],
      ),
    );
  }
}
