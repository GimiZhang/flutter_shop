import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';
import 'dart:convert';

//获取首页主题内容
Future getHomePageContent() async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    response = await dio.post(servicePath['homePageContent'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("接口异常");
    }
  } catch (e) {
    return print('ERROR:========>${e}');
  }
}


Future getBelowConten() async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    int page = 1;
    response = await dio.post(servicePath['homePageBelowConten'], data: page);
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      throw Exception("接口异常");
    }
  } catch (e) {
    return print('ERROR:========>${e}');
  }
}


Future request(url,Map<Object,Object> params) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    if(params == null){
      String jsonParams = jsonEncode(params);
      response = await dio.post(servicePath['homePageContent'], data: jsonParams);
    }else{
      response = await dio.post(servicePath['homePageContent']);
    }
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    response = await dio.post(servicePath['homePageContent'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("接口异常");
    }
  } catch (e) {
    return print('ERROR:========>${e}');
  }
}
