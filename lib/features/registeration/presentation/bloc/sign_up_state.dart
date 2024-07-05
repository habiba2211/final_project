part of 'sign_up_bloc.dart';

enum ScreenStatus { init, loading, successfully, failure }

class SignUpState {
  final ScreenStatus? screenStatus;
  final UserEntity? userEntity;
  final Failure? failures;

  SignUpState({this.screenStatus, this.userEntity,this.failures});

  SignUpState copyWith({ScreenStatus? screenStatus, UserEntity? userEntity,Failure? failures }) {
    return SignUpState(
        screenStatus: screenStatus ?? this.screenStatus,
        failures: failures ?? this.failures,
        userEntity: userEntity ?? this.userEntity);
  }
}

class SignUpInitial extends SignUpState {
  SignUpInitial() : super(screenStatus: ScreenStatus.init, userEntity: null);
}
