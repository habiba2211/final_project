import 'package:bloc/bloc.dart';
import 'package:final_project/main.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/routes.dart';
import '../../data/models/registration_body.dart';
import '../../data/models/registration_reponse.dart';
import '../../domain/repo/registration_repo.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final RegistrationRepo regRepo;
  RegistrationCubit({required this.regRepo}) : super(RegistrationInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController parPhoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  confirmForm() {
    if (formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      // Navigator.pushNamed(
      //   navigatorKey.currentState!.context,
      //   AppRoutes.login,
      // );
    } else {
      return;
    }
  }
  RegistrationBody createRegistrationBody() {
    return RegistrationBody(
      firstName:nameController.text,

    );
  }
  Future<void> register() async {
    emit(AuthLoading());

    var result = await regRepo.register(createRegistrationBody());
    result.fold(
          (l) => emit(AuthError(l)),
          (r) async {
        // await localStorage.writeSecureData(ApiConstants.tokenKey, r!.token!);
        emit(AuthSuccess(r!));
      },
    );
  }

  @override
  void emit(RegistrationState state) {
    if (!isClosed) super.emit(state);
  }
}
