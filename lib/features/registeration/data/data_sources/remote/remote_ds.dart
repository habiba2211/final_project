import 'package:final_project/features/registeration/data/models/UserModel.dart';
import 'package:final_project/features/registeration/data/models/requst_data.dart';

abstract class RemoteDataSource{

  Future<UserModel> signUp(RequestData requestData);
}