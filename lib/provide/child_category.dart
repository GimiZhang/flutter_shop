import 'package:flutter/material.dart';
import '../model/category_entity.dart';

class ChildCategory with ChangeNotifier {
  List<CategoryDataBxmallsubdto> categoryList = [];
  String mallSubName;

  getChildCategory(List<CategoryDataBxmallsubdto> list) {
    CategoryDataBxmallsubdto categoryDataBxmallsubdto =
        CategoryDataBxmallsubdto();
    categoryDataBxmallsubdto.mallSubName = "全部";
    categoryDataBxmallsubdto.comments = "null";
    categoryDataBxmallsubdto.mallCategoryId = "";
    categoryDataBxmallsubdto.mallSubId = "00";
    categoryList.clear();
    categoryList.add(categoryDataBxmallsubdto);
    categoryList.addAll(list);
    notifyListeners();
  }

  void setChooseName(String mallSubName){
    this.mallSubName = mallSubName;
    notifyListeners();
  }
}
