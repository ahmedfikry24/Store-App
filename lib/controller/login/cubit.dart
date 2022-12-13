// ignore_for_file: unnecessary_type_check, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/controller/login/states.dart';
import 'package:store_app/core/crud.dart';
import 'package:store_app/core/links_app.dart';
import 'package:store_app/services/services.dart';
import 'package:store_app/view/screens/home_screen.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitilaState());
  static LoginCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> signupGlobalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  bool obscure = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPhoneController = TextEditingController();
  Crud crud = Crud();
  changeOBST() {
    obscure = !obscure;
    emit(ChangeOBSTState());
  }

  login(BuildContext context) async {
    if (globalKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var response = await crud.postData(url: AppLinks.login, data: {
        "email": emailController.text,
        "password": passwordController.text,
      });
      if (response is Map<String, dynamic>) {
        if (response['status'] == true) {
          await sharedPreferences!.setBool('homepage', true);
          await sharedPreferences!
              .setString('email', response['data']['email']);
          await sharedPreferences!
              .setString('token', response['data']['token']);
          Services.token = response['data']['token'];
          emit(LoginSuccessState());
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false);
        } else {
          emit(LoginErrorState());
        }
      } else {
        emit(LoginErrorState());
      }
    }
  }

  sginUp(BuildContext context) async {
    if (signupGlobalKey.currentState!.validate()) {
      emit(SginUpLoadingState());
      var response = await crud.postData(url: AppLinks.signup, data: {
        "email": signupEmailController.text,
        "password": signupPasswordController.text,
        "name": signupNameController.text,
        "phone": signupPhoneController.text,
      });
      if (response is Map<String, dynamic>) {
        if (response['status'] == true) {
          emit(SginUpSuccessState());
          Navigator.of(context).pop();
        }
        emit(SginUpErrorState());
      } else {
        emit(SginUpErrorState());
      }
    }
  }
}
