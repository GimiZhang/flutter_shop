import 'package:flutter/material.dart';
import '../model/category_entity.dart';

class ChildCategory with ChangeNotifier{

  List<CategoryDataBxmallsubdto> categoryList = [];

  getChildCategory(List list){
    categoryList = list;
    notifyListeners();
}

}