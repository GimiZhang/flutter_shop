import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index_page.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import 'provide/counter.dart';
import 'provide/child_category.dart';
import 'package:flutter_shop/provide/categroy_goods_list_provide.dart';
import 'provide/good_detail_provide.dart';
import 'package:fluro/fluro.dart';
import 'routers/routers.dart';
import 'routers/application.dart';
import 'package:flutter_shop/provide/card.dart';
import 'package:flutter_shop/provide/current_index.dart';

void main() {
  var counter = Counter();
  var providers = Providers();
  var currentIndexProvide = CurrentIndexProvide();
  var childCategory = ChildCategory();
  var detailInfoProvide = DetailInfoProvide();
  var categoryGoodsList = CategoryGoodsListProvider();
  var cardProvide = CardProvide();
  providers..provide(Provider<Counter>.value(counter))
  ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide))
  ..provide(Provider<CategoryGoodsListProvider>.value(categoryGoodsList))
  ..provide(Provider<DetailInfoProvide>.value(detailInfoProvide))
  ..provide(Provider<CardProvide>.value(cardProvide))
  ..provide(Provider<ChildCategory>.value(childCategory));
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //配置路由
    final router = Router();
    Routers.configureRouters(router);
    Application.router = router;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,//初始化配置路由
      title: '百姓生活+',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: IndexPage(),
    );
  }
}
