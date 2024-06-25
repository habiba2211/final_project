part of 'sign_up_bloc.dart';

enum ScreenStatus { init, loading, successfully, failure }

class SignUpState {
  final ScreenStatus? screenStatus;
  final UserEntity? userEntity;

  SignUpState({this.screenStatus, this.userEntity});

  SignUpState copyWith({ScreenStatus? screenStatus, UserEntity? userEntity}) {
    return SignUpState(
        screenStatus: screenStatus ?? this.screenStatus,
        userEntity: userEntity ?? this.userEntity);
  }
}

final class SignUpInitial extends SignUpState {
  SignUpInitial() : super(screenStatus: ScreenStatus.init, userEntity: null);
}
