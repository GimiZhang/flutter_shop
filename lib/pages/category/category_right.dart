import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/model/category_entity.dart';
import 'package:flutter_shop/provide/child_category.dart';

class CategoryRight extends StatefulWidget {
  @override
  _CategoryRightState createState() => _CategoryRightState();
}

class _CategoryRightState extends State<CategoryRight> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //右侧上部分导航栏
        CategoryRightNav(),
      ],
    );
  }
}

class CategoryRightNav extends StatefulWidget {
  @override
  _CategoryRightNavState createState() => _CategoryRightNavState();
}

class _CategoryRightNavState extends State<CategoryRightNav> {
  List list = ["名酒", "宝丰", "二锅头"];

  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context,child,childCategory){
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(880),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: childCategory.categoryList.length,
              itemBuilder: (context, index) {
                return _categoryNav(childCategory.categoryList[index]);
              }),
        );
      },
    );
  }

  Widget _categoryNav(CategoryDataBxmallsubdto navItem) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          navItem.mallSubName,
          style: TextStyle(fontSize: ScreenUtil().setSp(38)),
        ),
      ),
    );
  }
}
