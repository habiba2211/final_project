import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/api/api_manager.dart';
import 'package:final_project/core/api/end_point.dart';
import 'package:final_project/core/error/failuers.dart';
import 'package:final_project/features/login/data/data_sources/remote/remote_ds.dart';
import 'package:final_project/features/registeration/data/models/UserModel.dart';
import 'package:flutter/material.dart';

class LoginRemoteDSImpl implements LoginRemoteDS {
  ApiManager apiManager;

  LoginRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failure, UserModel>> login(
      String email, String password) async {
    try {
      print("Here");
      debugPrint(EndPoints.logIn);
      //debugPrint (requestData.toJson().toString());
      Response response = await apiManager.postData(
          endPoint: EndPoints.logIn,
          body: {"email": email, "password": password});
      print("heree ${response.statusCode}");
      print("heree ${response.data}");
      UserModel userModel = UserModel.fromJson(response.data);
      return Right(userModel);
    } catch (e) {
      return Left(RemoteFailure(e.toString()));
    }
  }
}
