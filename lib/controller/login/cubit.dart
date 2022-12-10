// ignore_for_file: unnecessary_type_check
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/controller/login/states.dart';
import 'package:store_app/core/crud.dart';
import 'package:store_app/core/links_app.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitilaState());
  static LoginCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> signupGlobalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPhoneController = TextEditingController();
  Crud crud = Crud();
  login() async {
    if (globalKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var response = await crud.postData(AppLinks.login, {
        "email": emailController.text,
        "password": passwordController.text,
      });
      if (response is Map<String, dynamic>) {
        if (response['status'] == true) {
          emit(LoginSuccessState());
        }
        emit(LoginErrorState());
      } else {
        emit(LoginErrorState());
      }
    }
  }

  sginUp() async {
    if (signupGlobalKey.currentState!.validate()) {
      emit(SginUpLoadingState());
      var response = await crud.postData(AppLinks.signup, {
        "email": signupEmailController.text,
        "password": signupPasswordController.text,
        "name": signupNameController.text,
        "phone": signupPhoneController.text,
      });
      if (response is Map<String, dynamic>) {
        if (response['status'] == true) {
          emit(SginUpSuccessState());
        }
        emit(SginUpErrorState());
      } else {
        emit(SginUpErrorState());
      }
    }
  }
}
