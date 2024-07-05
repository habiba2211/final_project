import 'package:final_project/core/api/api_manager.dart';
import 'package:final_project/core/error/failuers.dart';
import 'package:final_project/core/utils/constants.dart';
import 'package:final_project/features/registeration/data/data_sources/remote/remote_ds.dart';
import 'package:final_project/features/registeration/data/data_sources/remote/remote_ds_impl.dart';
import 'package:final_project/features/registeration/data/models/requst_data.dart';
import 'package:final_project/features/registeration/data/repositories/signup_repo_impl.dart';
import 'package:final_project/features/registeration/domain/entities/UserEntity.dart';
import 'package:final_project/features/registeration/domain/repositories/signup_repo.dart';
import 'package:final_project/features/registeration/domain/use_cases/signUp_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  ApiManager apiManager;

  static SignUpBloc get(context) => BlocProvider.of(context);
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController parPhoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  confirmForm() {
    if (AppConstance.formKey1.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      add(RegiesterEvent());
      // Navigator.pushNamed(
      //   navigatorKey.currentState!.context,
      //   AppRoutes.login,
      // );
    } else {
      return;
    }
  }

  SignUpBloc(this.apiManager) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is RegiesterEvent) {
        debugPrint("the registration event is fired ");
        emit(state.copyWith(screenStatus: ScreenStatus.loading));

        RemoteDataSource remoteDataSource =
            RemoteDataSourceImplmentation(apiManager);
        SignUpRepo signUpRepo = SignUpRepoImpl(remoteDataSource);
        SignUpUseCase signUpUseCase = SignUpUseCase(signUpRepo);

        RequestData requestData = RequestData(
          firstName: nameController.text,
          lastName: lastNameController.text,
          phoneNumber: phoneController.text,
          nationality: "test",
          email: emailController.text,
          password: passWordController.text,
          address: noteController.text,
        );

          var result = await signUpUseCase.call(requestData);
          result.fold((l) {
            emit(state.copyWith(screenStatus: ScreenStatus.failure,failures: l));
          }, (r) {
            emit(state.copyWith(
                screenStatus: ScreenStatus.successfully, userEntity: r));
          });

      }
    });
  }
}
