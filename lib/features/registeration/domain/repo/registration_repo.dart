import 'package:dartz/dartz.dart';
import 'package:final_project/features/registeration/data/models/registration_body.dart';
import 'package:final_project/features/registeration/data/models/registration_reponse.dart';

import '../../data/web_services/resgistration_web_service.dart';

class RegistrationRepo{
  final RegistrationWebService regWebSer;
  RegistrationRepo({required this.regWebSer});
  Future<Either<String, RegistrationResponse?>> register(
      RegistrationBody signupBody) async {
    try {
      final response = await regWebSer.register(signupBody);
      return right(response);
      // if (response!.status! == 200) {
      //   return right(response);
      // } else {
      //   return left(response.message ?? "");
      // }
    } catch (e) {
      return left(e.toString());
    }
  }
}