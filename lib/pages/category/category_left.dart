import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:provide/provide.dart';
import '../../entity_factory.dart';
import 'package:flutter_shop/model/category_entity.dart';
import 'dart:convert';
import 'package:flutter_shop/network/home_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/child_category.dart';
import 'package:flutter_shop/model/category_goods_entity.dart';
import 'package:flutter_shop/provide/categroy_goods_list_provide.dart';

//分类左边列表
class CategoryLeft extends StatefulWidget {
  @override
  _CategoryLeftState createState() => _CategoryLeftState();
}

class _CategoryLeftState extends State<CategoryLeft> {
  List leftCategorys = [];
  int currentIndex = 0;

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
    bool isClick = false;
    isClick = (index == currentIndex);

    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
        List<CategoryDataBxmallsubdto> childCategory = leftCategorys[index].bxMallSubDto;
        Provide.value<ChildCategory>(context).getChildCategory(childCategory);
        //只有数据不为零的时候 再获取数据
        if(childCategory.length != 0){
          Provide.value<CategoryGoodsListProvider>(context).page = 1;
          Provide.value<CategoryGoodsListProvider>(context).categoryId =
              childCategory[0].mallCategoryId;
          Provide.value<CategoryGoodsListProvider>(context).categorySubId =
              childCategory[0].mallSubId;
          Provide.value<CategoryGoodsListProvider>(context).enableLoad = true;
          getGoodList(
              childCategory[0].mallCategoryId, childCategory[0].mallSubId);
        }else{
          List<CategoryGoodsData>  list = [];
          Provide.value<CategoryGoodsListProvider>(context).page = 1;
          Provide.value<CategoryGoodsListProvider>(context).getCategoryGoodsList(list);
        }

      },
      child: Container(
        alignment: Alignment.center,
        height: ScreenUtil().setHeight(120),
        child: Text(
          leftCategorys[index].mallCategoryName,
          style: TextStyle(fontSize: 15),
        ),
        decoration: BoxDecoration(
            color: isClick ? Color.fromRGBO(236, 236, 236, 1.0) : Colors.white,
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
      Provide.value<ChildCategory>(context)
          .getChildCategory(leftCategorys[0].bxMallSubDto);
      getGoodList(leftCategorys[0].bxMallSubDto[0].mallCategoryId,
          leftCategorys[0].bxMallSubDto[0].mallSubId);
    });
  }

  void getGoodList(String categoryId, String categorySubId) async {
    print("参数：=====" + categoryId + "--------" + categorySubId);
    await getGoodsList(categoryId, categorySubId, 1).then((onValue) {
      var data = json.decode(onValue.toString());
      CategoryGoodsEntity categoryGoodsEntity = EntityFactory.generateOBJ(data);
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
