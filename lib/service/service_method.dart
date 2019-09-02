import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

//封装网络请求Post
Future requestPost(url, {Map<Object, Object> params}) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    if (params != null) {
      response = await dio.post(url, data: params);
      print(url+"----"+params.toString());
    } else {
      response = await dio.post(url);
    }
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

//封装网络请求Get
Future requestGet(url, {Map<Object, Object> params}) async {
  try {
    Response response;
    Dio dio = new Dio();
    if (params != null) {
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
    }
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
