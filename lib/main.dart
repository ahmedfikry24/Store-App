import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/controller/cubit.dart';
import 'package:store_app/controller/on_boarding/cubit.dart';
import 'package:store_app/services/services.dart';
import 'package:store_app/view/screens/home_screen.dart';
import 'package:store_app/view/screens/login.dart';
import 'package:store_app/view/screens/on_boarding.dart';

import 'my_cubit_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Services().getInit();
  // Services.onboarding = await sharedPreferences!.getBool('onboarding');
  Widget widget = const OnBoardingScreen();
  // if (Services.onboarding != null && Services.onboarding == true) {
  //   widget = const Login();
  // }

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
          create: (context) => OnBoardingCubit(),
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
