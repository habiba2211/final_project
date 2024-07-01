import 'package:dartz/dartz.dart';
import 'package:final_project/core/error/failuers.dart';
import 'package:final_project/features/registeration/data/models/UserModel.dart';

abstract class LoginRemoteDS {
  Future<Either<Failure, UserModel>> login(String email, String password);
}
