import 'package:final_project/features/registeration/data/models/registration_reponse.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/end_point.dart';
import '../models/registration_body.dart';

class RegistrationWebService {
  final Dio dio;

  RegistrationWebService({required this.dio});
  Future<RegistrationResponse?> register(RegistrationBody signupBody) async {
    final response = await dio.post(
      EndPoints.signUp,
      data: signupBody.toJson(),
    );
    return RegistrationResponse.fromJson(response.data);
  }
}
