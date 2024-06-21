import 'package:final_project/features/registeration/data/models/requst_data.dart';
import 'package:final_project/features/registeration/domain/entities/UserEntity.dart';

abstract class SignUpRepo{

  Future<UserEntity> signUp(RequestData requestData);  //بحط فيها كل ال functions
}