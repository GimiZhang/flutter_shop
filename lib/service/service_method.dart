import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';


/**
 * 封装网络请求
 */
Future request(url, {Map<Object, Object> params}) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    if (params != null) {
      response = await dio.post(url, data: params);
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
