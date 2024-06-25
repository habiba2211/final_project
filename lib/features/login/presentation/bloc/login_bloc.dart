import 'package:bloc/bloc.dart';
import 'package:final_project/core/api/api_manager.dart';
import 'package:final_project/core/error/failuers.dart';
import 'package:final_project/core/utils/constants.dart';
import 'package:final_project/features/login/data/data_sources/remote/login_ds_impl.dart';
import 'package:final_project/features/login/data/data_sources/remote/remote_ds.dart';
import 'package:final_project/features/login/data/repositories/login_repo_impl.dart';
import 'package:final_project/features/login/domain/repositories/login_repo.dart';
import 'package:final_project/features/login/domain/use_cases/login_usecase.dart';
import 'package:final_project/features/registeration/domain/entities/UserEntity.dart';
import 'package:final_project/features/registeration/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  ApiManager apiManager;

  static LoginBloc get(context) => BlocProvider.of(context);
   GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  confirmForm() {
    print(emailController.text);
    print(passWordController.text);
    // add(LoginButtonEvent());
    if (loginFormKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      add(LoginButtonEvent());
      // Navigator.pushNamed(
      //   navigatorKey.currentState!.context,
      //   AppRoutes.login,
      // );
    } else {
      return;
    }
  }

  @override
  void emit(LoginState state) {
    if (!isClosed) super.emit(state);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  LoginBloc(this.apiManager) : super(const LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginButtonEvent) {
        debugPrint("the Login event is fired ");
        emit(state.copyWith(screenStatus: ScreenStatus.loading));

        LoginRemoteDS loginRemoteDS = LoginRemoteDSImpl(apiManager);
        LoginRepo loginRepo = LoginRepoImpl(loginRemoteDS);
        LoginUseCase loginUseCase = LoginUseCase(loginRepo);

        var result = await loginUseCase.call(
            emailController.text, passWordController.text);
        result.fold((l) {
          emit(state.copyWith(screenStatus: ScreenStatus.failure, failures: l));
        }

            , (r) {
              emit(state.copyWith(
                  userEntity: r,
                  screenStatus: ScreenStatus.successfully
              ));
            }
        );
      }
    });
  }}

