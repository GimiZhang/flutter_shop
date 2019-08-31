import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category_goods_entity.dart';

class CategoryGoodsListProvider with ChangeNotifier {
  int page = 1;
  String categoryId="4";
  String categorySubId="";
  int childIndex;
  bool enableLoad = true;
  List<CategoryGoodsData> categoryGoods = [];

  getCategoryGoodsList(List<CategoryGoodsData> categoryGoodslist) {
    if (page == 1) {
      categoryGoods = categoryGoodslist;
    } else {
      categoryGoods.addAll(categoryGoodslist);
    }
    notifyListeners();
  }

  changeChildIndex(index, String categoryId, String categorySubId) {
    childIndex = index;
    this.categoryId = categoryId;
    this.categorySubId = categorySubId;
    notifyListeners();
  }

  addPage() {
    page++;
  }
}
