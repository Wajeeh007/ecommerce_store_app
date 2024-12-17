import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_store/bloc_and_cubit/base/base_bloc.dart';
import 'package:ecommerce_store/bloc_and_cubit/base/base_event.dart';
import 'package:ecommerce_store/bloc_and_cubit/base/base_state.dart';
import 'package:ecommerce_store/utils/constants.dart';
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
    super.initState();

    context.read<BaseBloc>().add(InitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocListener<BaseBloc, BaseState>(
        listenWhen: (previous, current) => previous.internetCheckState != current.internetCheckState,
        listener: (context, state) {
          if(state.internetCheckState == LoadingState.initial) {
            return ;
          } else {
            if(state.internetAvailable) {
              if(state.isUsingFirstTime) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SizedBox()));
              } else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SizedBox()));
              }
            }
          }
        },
        child: BlocBuilder<BaseBloc, BaseState>(
          builder: (context, state) {
            if (state.internetCheckState == LoadingState.initial) {
              return const CircularProgressIndicator(strokeWidth: 5,);
            } else if (state.internetCheckState == LoadingState.complete && state.internetAvailable) {
              return SizedBox();
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}