import 'package:ecommerce_store/utils/constants.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvents extends Equatable {

  @override
  List<Object?> get props => [];

}

class EmailInputEvent extends LoginEvents {

  final String value;

  EmailInputEvent({required this.value});

}

class PasswordInputEvent extends LoginEvents {

  final String value;

  PasswordInputEvent({required this.value});

}

class ShowPasswordEvent extends LoginEvents {}

class ShowLoaderEvent extends LoginEvents {}

class RemoveLoaderEvent extends LoginEvents {

  final LoadingState loadingState;

  RemoveLoaderEvent({required this.loadingState});
}

class LoginApiEvent extends LoginEvents {}