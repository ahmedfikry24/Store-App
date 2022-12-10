import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/controller/login/cubit.dart';
import 'package:store_app/controller/login/states.dart';
import 'package:store_app/view/widgets/auth/custom_login_botton.dart';
import 'package:store_app/view/widgets/auth/custom_signup_botton.dart';
import 'package:store_app/view/widgets/auth/custom_text_title.dart';
import 'package:store_app/view/widgets/auth/custom_textform.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.grey),
        centerTitle: true,
      ),
      body: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Form(
                  key: cubit.signupGlobalKey,
                  child: Column(children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const CustomTextTitleAuth(title: 'Sgin Up'),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Sing Up With Your Information\nto enjoy our hot offers ',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextForm(
                        hinttext: 'enter your name',
                        labeltext: 'username',
                        textInputType: TextInputType.name,
                        controller: cubit.signupNameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'username required';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextForm(
                        hinttext: 'enter your email',
                        labeltext: 'email address',
                        textInputType: TextInputType.emailAddress,
                        controller: cubit.signupEmailController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'eamil address required';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextForm(
                        hinttext: 'enter your phone',
                        labeltext: 'phone number',
                        textInputType: TextInputType.phone,
                        controller: cubit.signupPhoneController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'phone required';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextForm(
                        hinttext: 'enter your password',
                        labeltext: 'password',
                        textInputType: TextInputType.visiblePassword,
                        controller: cubit.signupPasswordController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'password required';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomloginBotton(
                        textbottom: 'sgin up',
                        onpressed: () {
                          cubit.sginUp();
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomSginUpBotton(
                        body: 'you have an account',
                        text: 'login now',
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
