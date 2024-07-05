import 'package:dartz/dartz.dart';
import 'package:final_project/features/registeration/data/models/requst_data.dart';
import 'package:final_project/features/registeration/domain/entities/UserEntity.dart';

import '../../../../core/error/failuers.dart';

abstract class SignUpRepo{

  Future <Either<Failure, UserEntity>> signUp(RequestData requestData);  //بحط فيها كل ال functions
}