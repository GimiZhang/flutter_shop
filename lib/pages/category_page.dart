import 'package:flutter/material.dart';
import 'category/category_left.dart';
import 'category/category_right.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品分类"),
      ),
      body: Container(
        child: Row(
          children: <Widget>[CategoryLeft(), CategoryRight()],
        ),
      ),
    );
  }
}
