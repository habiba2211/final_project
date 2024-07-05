import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/api/api_manager.dart';
import 'package:final_project/core/api/end_point.dart';
import 'package:final_project/core/error/failuers.dart';
import 'package:final_project/features/registeration/data/data_sources/remote/remote_ds.dart';
import 'package:final_project/features/registeration/data/models/UserModel.dart';
import 'package:final_project/features/registeration/data/models/requst_data.dart';
import 'package:flutter/cupertino.dart';

class RemoteDataSourceImplmentation implements RemoteDataSource {
  ApiManager apiManager;

  RemoteDataSourceImplmentation(this.apiManager);

  @override
  Future <Either<Failure, UserModel>> signUp(RequestData requestData) async {
    try {
      print("Here");
      debugPrint(EndPoints.signUp);
      debugPrint (requestData.toJson().toString());

      Response response = await apiManager.postData(
          endPoint: EndPoints.signUp, body: requestData.toJson());
      print("heree ${response.statusCode}");
      print("heree ${response.data}");

      UserModel userModel = UserModel.fromJson(response.data);
      print(userModel.token ?? "Token error");
      return Right(userModel);
    } catch (e) {
      return Left(RemoteFailure(e.toString()));
    }
  }
}
