import 'package:ecommerce_store/bloc_and_cubit/base/base_bloc.dart';
import 'package:ecommerce_store/screens/base.dart';
import 'package:ecommerce_store/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => BaseBloc(),
  child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce Store',
      theme: ThemeHelper.lightTheme,
      darkTheme: ThemeHelper.lightTheme,
      home: const BaseScreen(),
    ),
    );
  }
}