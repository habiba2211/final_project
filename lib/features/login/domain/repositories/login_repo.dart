import 'package:dartz/dartz.dart';
import 'package:final_project/core/error/failuers.dart';
import 'package:final_project/features/registeration/domain/entities/UserEntity.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserEntity>> login(String email, String password);
}
