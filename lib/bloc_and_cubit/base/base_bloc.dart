import 'package:bloc/bloc.dart';
import 'package:ecommerce_store/utils/constants.dart';

import '../../utils/common_functions.dart';
import 'base_event.dart';
import 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {

  BaseBloc() : super(const BaseState()) {
    on<InitEvent>(_initializeBaseEvent);
  }

  void _initializeBaseEvent(InitEvent event, Emitter<BaseState> emit) async {

    final result = await CommonFunctions().hasInternet();
    final isFirstTime = await CommonFunctions().readValueFromStrg('isFirstTime');
    return emit(state.copyWith(internetCheckState: LoadingState.complete, internetAvailable: result, isUsingFirstTime: isFirstTime ?? false));
  }
}