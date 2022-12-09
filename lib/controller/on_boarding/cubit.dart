// ignore_for_file: unnecessary_type_check

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/controller/on_boarding/states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitilaState());
  static OnBoardingCubit get(context) => BlocProvider.of(context);
  PageController pageController = PageController();
}
