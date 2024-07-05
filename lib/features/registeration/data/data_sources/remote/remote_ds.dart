import 'package:dartz/dartz.dart';
import 'package:final_project/core/error/failuers.dart';
import 'package:final_project/features/registeration/data/models/UserModel.dart';
import 'package:final_project/features/registeration/data/models/requst_data.dart';

abstract class RemoteDataSource{

  Future <Either<Failure, UserModel>> signUp(RequestData requestData);
}