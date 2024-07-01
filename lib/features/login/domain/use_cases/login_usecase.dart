import 'package:dartz/dartz.dart';
import 'package:final_project/core/error/failuers.dart';
import 'package:final_project/features/login/domain/repositories/login_repo.dart';
import 'package:final_project/features/registeration/domain/entities/UserEntity.dart';

class LoginUseCase {
  LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);
  Future<Either<Failure, UserEntity>> call(String email, String password) =>
      loginRepo.login(email, password);
}
