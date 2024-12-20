import 'package:ecommerce_store/bloc_and_cubit/base/base_bloc.dart';
import 'package:ecommerce_store/bloc_and_cubit/base/base_event.dart';
import 'package:ecommerce_store/bloc_and_cubit/base/base_state.dart';
import 'package:ecommerce_store/bloc_and_cubit/login/login_bloc.dart';
import 'package:ecommerce_store/screens/login.dart';
import 'package:ecommerce_store/screens/onboard.dart';
import 'package:ecommerce_store/utils/constants.dart';
import 'package:ecommerce_store/utils/custom_widgets/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {


  @override
  void initState() {
    context.read<BaseBloc>().add(InitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocListener<BaseBloc, BaseState>(
        listenWhen: (previous, current) => current.internetCheckState == LoadingState.initial || current.internetCheckState == LoadingState.complete,
        listener: (context, state) {
          if(state.internetCheckState == LoadingState.initial) {
            return ;
          } else {
            if(state.internetAvailable) {
              if(state.isUsingFirstTime) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Onboard()));
              } else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BlocProvider(
                  create: (context) => LoginBloc(),
                  child: const Login(),
                ))
                );
              }
            }
          }
        },
        child: BlocBuilder<BaseBloc, BaseState>(
          builder: (context, state) {
            if (state.internetCheckState == LoadingState.initial) {
              return const CircularProgressIndicator(strokeWidth: 5,);
            } else if (state.internetCheckState == LoadingState.complete && state.internetAvailable) {
              return const SizedBox();
            } else {
              return NoInternet(
                  onBtnPress: () {
                    Navigator.pop(context);
                    setState(() {});
                  });
            }
          },
        ),
      ),
    );
  }
}