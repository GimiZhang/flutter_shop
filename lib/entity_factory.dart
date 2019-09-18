import 'package:flutter_shop/model/category_goods_entity.dart';
import 'package:flutter_shop/model/category_entity.dart';
import 'package:flutter_shop/model/product_deatil_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "CategoryGoodsEntity") {
      return CategoryGoodsEntity.fromJson(json) as T;
    } else if (T.toString() == "CategoryEntity") {
      return CategoryEntity.fromJson(json) as T;
    } else if (T.toString() == "ProductDeatilEntity") {
      return ProductDeatilEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}