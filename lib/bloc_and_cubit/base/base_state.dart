import 'package:ecommerce_store/utils/constants.dart';
import 'package:equatable/equatable.dart';

class BaseState extends Equatable {

  final LoadingState internetCheckState;
  final bool internetAvailable;
  final bool isUsingFirstTime;

  const BaseState({
    this.internetCheckState = LoadingState.initial,
    this.internetAvailable = true,
    this.isUsingFirstTime = false
  });

  BaseState copyWith({
    LoadingState? internetCheckState,
    bool? internetAvailable,
    bool? isUsingFirstTime,
  }) {
    return BaseState(
        internetCheckState: this.internetCheckState,
        internetAvailable: this.internetAvailable,
        isUsingFirstTime: this.isUsingFirstTime
    );
  }

  @override
  List<Object?> get props => [internetCheckState, internetAvailable];
}