import 'package:flutter/material.dart';
import '../../entity_factory.dart';
import 'package:flutter_shop/model/category_entity.dart';
import 'dart:convert';
import 'package:flutter_shop/network/home_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toast/toast.dart';

//分类左边列表
class CategoryLeft extends StatefulWidget {
  @override
  _CategoryLeftState createState() => _CategoryLeftState();
}

class _CategoryLeftState extends State<CategoryLeft> {
  List leftCategorys = [];

  @override
  void initState() {
    getDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(200),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
          itemCount: leftCategorys.length,
          itemBuilder: (context, index) {
            return _leftInkwell(index);
          }),
    );
  }

  Widget _leftInkwell(int index) {
    return InkWell(
      onTap: () {
        Toast.show(leftCategorys[index].mallCategoryName, context);
      },
      child: Container(
        alignment: Alignment.center,
        height: ScreenUtil().setHeight(120),
        child: Text(
          leftCategorys[index].mallCategoryName,
          style: TextStyle(fontSize: 15),
        ),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      ),
    );
  }

  //获取分类数据
  void getDatas() {
    getCategory().then((onValue) {
      var data = json.decode(onValue.toString());
      CategoryEntity categoryEntity = EntityFactory.generateOBJ(data);
      setState(() {
      leftCategorys = categoryEntity.data;
      });
    });
  }
}
