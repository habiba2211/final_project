import 'package:final_project/config/routes/routes.dart';
import 'package:final_project/core/utils/controllers.dart';
import 'package:final_project/features/login/presentation/bloc/login_bloc.dart';
import 'package:final_project/features/registeration/presentation/widgets/field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubitLog = context.read<LoginBloc>();
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white10,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40.0,
                    backgroundImage: AssetImage(
                      'assets/images/logo.png',
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: cubitLog.loginFormKey,
                    child: Column(
                      children: [
                        TextFieldItem(
                          txt: 'Enter Email or Phone Number',
                          controller: cubitLog.emailController,
                          obscureText: false,
                          textInputType: TextInputType.emailAddress,
                          warningMessage: 'Please Enter Your Email',
                          sufIcon: null,
                          postIcon: null,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFieldItem(
                          txt: 'Enter Password',
                          controller: cubitLog.passWordController,
                          obscureText: true,
                          textInputType: TextInputType.text,
                          warningMessage: 'Please Enter password',
                          sufIcon: null,
                          postIcon: null,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.green.shade300,
                          ),
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: () {
                              cubitLog.confirmForm();

                              // Navigator.pushReplacementNamed(
                              //     context, AppRoutes.homeLayout);
                            },
                            disabledColor: Colors.blue,
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.signUp);
                          },
                          child: const Text(
                            'Sign Up',
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Forgot PassWord ?',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
