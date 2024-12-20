import 'package:bloc/bloc.dart';
import 'package:ecommerce_store/utils/constants.dart';
import 'package:fast_rsa/fast_rsa.dart';

import '../../utils/common_functions.dart';
import 'base_event.dart';
import 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {

  BaseBloc() : super(const BaseState()) {
    on<InitEvent>(_initializeBaseEvents);
  }

  void _initializeBaseEvents(InitEvent event, Emitter<BaseState> emit) async {

    final result = await CommonFunctions().hasInternet();
    final isFirstTime = await CommonFunctions().readValueFromStrg('isFirstTime');
    if(isFirstTime == "null") {
      await _generateKeys();
    } else {
      var publicKey = await CommonFunctions().readValueFromStrg('public');
      if(publicKey == "null") await _generateKeys();
    }
    return emit(state.copyWith(
        internetCheckState: LoadingState.complete,
        internetAvailable: result,
        isUsingFirstTime: isFirstTime == "null" ? true : false)
    );
  }
}

Future<void> _generateKeys() async {
  
    var keys = await RSA.generate(4096);

    await CommonFunctions().writeValueToStrg('public', keys.publicKey.toString());
    await CommonFunctions().writeValueToStrg('private', keys.privateKey.toString());
    //TODO: call API to share public key with server
}