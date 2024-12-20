import 'package:ecommerce_store/utils/constants.dart';
import 'package:equatable/equatable.dart';

class LoginState extends Equatable {

  final String? email, password;
  final String apiResponseMsg;
  final LoadingState loadingState;
  final bool obscurePassword;

  const LoginState({
    this.email,
    this.apiResponseMsg = '',
    this.obscurePassword = true,
    this.loadingState = LoadingState.initial,
    this.password
  });

  @override
  List<Object?> get props => [email, password, loadingState, apiResponseMsg, obscurePassword];

  LoginState copyWith({
    String? email,
    String? password,
    String? apiResponseMsg,
    LoadingState? loadingState,
    bool? obscurePassword,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      apiResponseMsg: apiResponseMsg ?? this.apiResponseMsg,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      loadingState: loadingState ?? this.loadingState
    );
  }
}
