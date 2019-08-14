import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//功能模块组件
class HomeFuction extends StatelessWidget {
  final List functionList;

  HomeFuction({Key key, this.functionList}) : super(key: key);

  Widget _getFunctionItem(BuildContext context, item) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: InkWell(
        splashColor: Colors.transparent, //水波纹颜色
        highlightColor: Colors.transparent, //点击底色
        onTap: () {
          print("点击");
        },
        child: Center(
          child: Column(
            children: <Widget>[
              Image.network(
                item['image'],
                width: ScreenUtil().setWidth(210),
              ),
              Text(item['mallCategoryName'])
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(((functionList.length / 5)+1) * 200),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        physics: new NeverScrollableScrollPhysics(),//解决和scroview的滑动冲突
        children: functionList.map((item) {
          return _getFunctionItem(context, item);
        }).toList(),
      ),
    );
  }
}
