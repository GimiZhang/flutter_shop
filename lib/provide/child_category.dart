import 'package:flutter/material.dart';
import '../model/category_entity.dart';

class ChildCategory with ChangeNotifier {
  List<CategoryDataBxmallsubdto> categoryList = [];

  getChildCategory(List<CategoryDataBxmallsubdto> list) {
    CategoryDataBxmallsubdto categoryDataBxmallsubdto =
        CategoryDataBxmallsubdto();
    categoryDataBxmallsubdto.mallSubName = "全部";
    categoryDataBxmallsubdto.comments = "null";
    categoryDataBxmallsubdto.mallCategoryId = "00";
    categoryDataBxmallsubdto.mallSubId = "00";
    categoryList.clear();
    categoryList.add(categoryDataBxmallsubdto);
    categoryList.addAll(list);
    notifyListeners();
  }
}
