import 'package:dartz/dartz.dart';
import 'package:final_project/core/error/failuers.dart';
import 'package:final_project/features/login/data/data_sources/remote/remote_ds.dart';
import 'package:final_project/features/login/domain/repositories/login_repo.dart';
import 'package:final_project/features/registeration/domain/entities/UserEntity.dart';

class LoginRepoImpl implements LoginRepo {
  LoginRemoteDS loginRemoteDS;

  LoginRepoImpl(this.loginRemoteDS);

  @override
  Future<Either<Failure, UserEntity>> login(String email, String password) =>
      loginRemoteDS.login(email, password);
}
