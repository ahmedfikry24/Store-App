import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/controller/login/cubit.dart';
import 'package:store_app/controller/login/states.dart';
import 'package:store_app/view/screens/signup.dart';
import 'package:store_app/view/widgets/auth/custom_login_botton.dart';
import 'package:store_app/view/widgets/auth/custom_signup_botton.dart';
import 'package:store_app/view/widgets/auth/custom_text_title.dart';
import 'package:store_app/view/widgets/auth/custom_textform.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white60,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.grey),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Form(
                  key: cubit.globalKey,
                  child: Column(children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const CustomTextTitleAuth(title: 'Welcome Back'),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Sing In With Your Email & Password \n Or Continue With Social Information  ',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextForm(
                        hinttext: 'enter your email',
                        labeltext: 'email address',
                        textInputType: TextInputType.emailAddress,
                        controller: cubit.emailController,
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
                      hinttext: 'enter your password',
                      labeltext: 'password',
                      textInputType: TextInputType.visiblePassword,
                      controller: cubit.passwordController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'password required';
                        }
                        return null;
                      },
                      suffixicon: Icons.remove_red_eye,
                      obscureText: cubit.obscure,
                      onTap: () {
                        cubit.changeOBST();
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomloginBotton(
                        textbottom: 'login',
                        onpressed: () {
                          cubit.login(context);
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomSginUpBotton(
                        body: 'you don\'t have an account',
                        text: 'signup',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                        }),
                  ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
