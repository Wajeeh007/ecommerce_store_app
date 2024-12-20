import 'package:bloc/bloc.dart';
import 'package:ecommerce_store/utils/constants.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailInputEvent>(_emailInputEvent);
    on<PasswordInputEvent>(_passwordInputEvent);
    on<ShowPasswordEvent>(_showPassword);
    on<ShowLoaderEvent>(_showLoader);
    on<RemoveLoaderEvent>(_removeLoader);
  }

  void _emailInputEvent(EmailInputEvent event, Emitter<LoginState> emit) {
    return emit(state.copyWith(email: event.value));
  }

  void _passwordInputEvent(PasswordInputEvent event, Emitter<LoginState> emit) {
    return emit(state.copyWith(password: event.value));
  }

  void _showPassword(ShowPasswordEvent event, Emitter<LoginState> emit) {
    return emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void _showLoader(ShowLoaderEvent event, Emitter<LoginState> emit) async {
    return emit(state.copyWith(loadingState: LoadingState.loading));
  }

  void _removeLoader(RemoveLoaderEvent event, Emitter<LoginState> emit) async {
    return emit(state.copyWith(loadingState: event.loadingState));
  }
}