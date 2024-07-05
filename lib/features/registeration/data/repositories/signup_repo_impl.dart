
import 'package:dartz/dartz.dart';
import 'package:final_project/core/error/failuers.dart';
import 'package:final_project/features/registeration/data/data_sources/remote/remote_ds.dart';
import 'package:final_project/features/registeration/data/models/requst_data.dart';
import 'package:final_project/features/registeration/domain/entities/UserEntity.dart';
import 'package:final_project/features/registeration/domain/repositories/signup_repo.dart';

class SignUpRepoImpl implements SignUpRepo{
  RemoteDataSource remoteDataSource;

  SignUpRepoImpl(this.remoteDataSource);

  @override
  Future <Either<Failure, UserEntity>> signUp(RequestData requestData) => remoteDataSource.signUp(requestData);
}

