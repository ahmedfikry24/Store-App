// ignore_for_file: await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/controller/cubit.dart';
import 'package:store_app/controller/login/cubit.dart';
import 'package:store_app/services/services.dart';
import 'package:store_app/view/screens/home_screen.dart';
import 'package:store_app/view/screens/login.dart';
import 'package:store_app/view/screens/on_boarding.dart';

import 'my_cubit_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Services().getInit();
  Services.onboarding = await sharedPreferences!.getBool('onboarding');
  Services.homepage = await sharedPreferences!.getBool('homepage');
  Services.email = await sharedPreferences!.getString('email');
  Services.token = await sharedPreferences!.getString('token');
  Widget widget = const OnBoardingScreen();
  if (Services.onboarding != null && Services.onboarding == true) {
    if (Services.homepage != null && Services.homepage == true) {
      widget = const HomeScreen();
    } else {
      widget = const Login();
    }
  }

  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    widget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget widget;
  const MyApp({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => StoreAppCubit()..getAllProduct(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: widget,
      ),
    );
  }
}
