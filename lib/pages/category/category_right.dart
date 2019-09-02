import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/model/category_entity.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'category_goods_list.dart';
import 'package:flutter_shop/network/home_api.dart';
import 'package:flutter_shop/entity_factory.dart';
import 'package:flutter_shop/model/category_goods_entity.dart';
import 'dart:convert';
import 'package:flutter_shop/provide/categroy_goods_list_provide.dart';

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
        CategoryGoodsList()
      ],
    );
  }
}

class CategoryRightNav extends StatefulWidget {
  @override
  _CategoryRightNavState createState() => _CategoryRightNavState();
}

class _CategoryRightNavState extends State<CategoryRightNav> {

  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context,child,childCategory){
        return Container(
          height: ScreenUtil().setHeight(90),
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
      onTap: () {
        Provide.value<ChildCategory>(context).setChooseName(navItem.mallSubName);
        Provide.value<CategoryGoodsListProvider>(context).page = 1;
        Provide.value<CategoryGoodsListProvider>(context).categoryId =
            navItem.mallCategoryId;
        Provide.value<CategoryGoodsListProvider>(context).categorySubId =
            navItem.mallSubId;
        Provide.value<CategoryGoodsListProvider>(context).enableLoad = true;
        getGoodList(navItem.mallCategoryId, navItem.mallSubId);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(
          navItem.mallSubName,
          style: TextStyle(fontSize: ScreenUtil().setSp(38),
          color: navItem.mallSubName==Provide.value<ChildCategory>(context).mallSubName?Colors.pink:Colors.black),
        ),
      ),
    );
  }


  void getGoodList(String categoryId, String categorySubId) async {
    print("参数：=====" + categoryId + "--------" + categorySubId);
    await getGoodsList(categoryId, categorySubId, 1).then((onValue) {
      var data = json.decode(onValue.toString());
      CategoryGoodsEntity categoryGoodsEntity = EntityFactory.generateOBJ(data);
      if(categoryGoodsEntity.data == null){
        categoryGoodsEntity.data = [];
      }
      Provide.value<CategoryGoodsListProvider>(context)
          .getCategoryGoodsList(categoryGoodsEntity.data);
      if (categoryGoodsEntity.data.length >= 20) {
        Provide.value<CategoryGoodsListProvider>(context).addPage();
      } else {
        Provide.value<CategoryGoodsListProvider>(context).enableLoad = false;
      }
    });
  }
}
