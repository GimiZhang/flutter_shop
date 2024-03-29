import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'router_handler.dart';

class Routers{
  static String root = '/';
  static String detailsPage='/detail';

  static void configureRouters(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> paramsMap){
        print("Error==> NOT FOUND ROUTER");
        return null;
      }
    );

    router.define(detailsPage, handler: detailHandler);
  }
}