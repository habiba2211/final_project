import 'package:final_project/features/control/presentation/manager/control_cubit.dart';
import 'package:final_project/features/control/presentation/pages/control_screen.dart';
import 'package:final_project/features/home/presentation/pages/home_screen.dart';
import 'package:final_project/features/login/presentation/bloc/login_bloc.dart';
import 'package:final_project/features/login/presentation/pages/login_screen.dart';
// import 'package:final_project/features/registeration/presentation/bloc/registration_cubit.dart';
import 'package:final_project/features/registeration/presentation/bloc/sign_up_bloc.dart';
import 'package:final_project/features/registeration/presentation/pages/sign_up.dart';
import 'package:final_project/features/settings/presentation/pages/SettingScreen.dart';
import 'package:final_project/layout/home_layout.dart';
import 'package:final_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/di_manager.dart';
import '../../features/bluetooth_feature/presentation/screens/main_bluetooth_screen.dart';

class AppRoutes {
  // متعارف ان اول سكرينه بتفتح بنحطلها  "/"
  static const String splashScreen = "/";
  static const String login = "Login";
  static const String signUp = "SignUp";
  static const String community = "Community";
  static const String homeLayout = "HomeLayout";
  static const String controlScreen = "ControlScreen";
  static const String homeTap = "homeTap";
  static const String bluetooth = "bluetoothTab";
  static const String settings = "settingsScreen";
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRoutes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (_) => serviceLocator<LoginBloc>(),
                  child: BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state.screenStatus == ScreenStatus.successfully) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRoutes.homeLayout, (route) => false);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Success"),
                            content: Text(state.userEntity?.userName ?? ""),
                          ),
                        );
                        Navigator.pop;

                        // Navigator.pushReplacement(
                        //     navigatorKey.currentState!.context,
                        //     AppRoutes.homeLayout as Route<Object?>,
                        //   );
                        // LoginBloc.get(context).emailController.clear();
                        // LoginBloc.get(context).passWordController.clear();
                      }
                      if (state.screenStatus == ScreenStatus.failure) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text("Failue"),
                                  content: Text(state.failures?.message ?? ""),
                                ));
                      }
                    },
                    builder: (context, state) {
                      return LoginScreen();
                    },
                  ),
                ));
      case AppRoutes.signUp:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (_) => serviceLocator<SignUpBloc>(),
                child: BlocConsumer<SignUpBloc, SignUpState>(
                  listener: (context, state) {
                    if (state.screenStatus == ScreenStatus.successfully) {
                      Navigator.pushNamed(context, AppRoutes.login);
                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, AppRoutes.homeLayout, (route) => false);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("SignUp Success"),
                          content: Text(state.userEntity?.userName ?? ""),
                        ),
                      );
                      Navigator.pop;

                      // Navigator.pushReplacement(
                      //     navigatorKey.currentState!.context,
                      //     AppRoutes.homeLayout as Route<Object?>,
                      //   );
                      // LoginBloc.get(context).emailController.clear();
                      // LoginBloc.get(context).passWordController.clear();
                    }
                    if (state.screenStatus == ScreenStatus.failure) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Failue"),
                            content: Text(state.failures?.message ?? ""),
                          ));
                    }
                  },
                  builder: (context, state) {
                    return SignUpScreen();
                  },
                )));
      case AppRoutes.homeLayout:
        return MaterialPageRoute(builder: (context) => const HomeLayout());
      case AppRoutes.homeLayout:
        return MaterialPageRoute(builder: (context) => const HomeLayout());
      case AppRoutes.homeTap:
        return MaterialPageRoute(builder: (context) => const HomeTap());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (context) => const SettingScreen());
      case AppRoutes.controlScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => serviceLocator<ControlCubit>(),
            child: const ControlScreen(),
          ),
        );
      case AppRoutes.bluetooth:
        return MaterialPageRoute(
            builder: (context) => const MainBluetoothScreen());
      // return MaterialPageRoute(builder: (context) => BluetoothScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text("UnDefine"),
                  ),
                  body: unDefineRoute(),
                ));
    }
  }

  static Widget unDefineRoute() {
    return const Center(
      child: Text("Route Not Fount"),
    );
  }
}
