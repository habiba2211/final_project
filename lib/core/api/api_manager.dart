// مش هيشيلى كل ال apis هيشيل فانكشن ال get و post function

import 'package:dio/dio.dart';
import 'package:final_project/core/api/end_point.dart';

class ApiManager {
  late Dio dio;
  ApiManager() {
    dio = Dio();
  }

//لو ال api get
  Future<Response> getData(
      {required String endPoint, required Map<String, dynamic> data}) {
    return dio.get(EndPoints.baseUrl + endPoint, queryParameters: data);
  }

  Future<Response> postData({required String endPoint, required Object? body}) {
    return dio.post(
      endPoint,
      data: body,
      // options: Options(
      //   headers: {
      //     'Content-Type': 'application/json',
      //     'Accept': 'application/json',
      //   },
      // ),
    );
  }
}
