part of 'registration_cubit.dart';

abstract class RegistrationState {
  const RegistrationState();
}

class RegistrationInitial extends RegistrationState {
  // @override
  // List<Object> get props => [];
}


final class AuthLoading extends RegistrationState {

}final class AuthSuccess extends RegistrationState {
  final RegistrationResponse authData;

  AuthSuccess(this.authData);

  @override
  List<Object> get props => [authData];
}final class AuthError extends RegistrationState {
  final String message;

  AuthError(this.message);

  @override
  List<Object> get props => [message];
}