import 'package:final_project/features/registeration/data/models/requst_data.dart';
import 'package:final_project/features/registeration/domain/entities/UserEntity.dart';
import 'package:final_project/features/registeration/domain/repositories/signup_repo.dart';

class SignUpUseCase {
  SignUpRepo signUpRepo;

  SignUpUseCase(this.signUpRepo);

  Future <UserEntity> call(RequestData requestData) =>signUpRepo.signUp(requestData);
}
