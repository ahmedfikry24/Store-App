import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/controller/cubit.dart';
import 'package:store_app/controller/states.dart';
import 'package:store_app/core/themes.dart';
import 'package:store_app/view/widgets/auth/custom_login_botton.dart';
import 'package:store_app/view/widgets/auth/custom_signup_botton.dart';
import 'package:store_app/view/widgets/auth/custom_textform.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        elevation: 0,
        backgroundColor: Colors.white54,
        centerTitle: true,
        title: Text('profile', style: TextStyle(color: AppTheme.primaryColor)),
      ),
      body: BlocConsumer<StoreAppCubit, StoreAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          StoreAppCubit cubit = StoreAppCubit.get(context);
          cubit.nameController.text = cubit.getuserinfo?['data']['name'];
          cubit.emailController.text = cubit.getuserinfo?['data']['email'];
          cubit.phoneController.text = cubit.getuserinfo?['data']['phone'];
          return Form(
            key: cubit.globalKey,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  child: Image.network(
                    cubit.getuserinfo?['data']['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomTextForm(
                  hinttext: '',
                  labeltext: 'username',
                  textInputType: TextInputType.name,
                  controller: cubit.nameController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'name must have value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextForm(
                  hinttext: '',
                  labeltext: 'email',
                  textInputType: TextInputType.emailAddress,
                  controller: cubit.emailController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'email must have value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextForm(
                  hinttext: '',
                  labeltext: 'phone',
                  textInputType: TextInputType.phone,
                  controller: cubit.phoneController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'phone must have value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextForm(
                  hinttext: '',
                  labeltext: 'password',
                  textInputType: TextInputType.visiblePassword,
                  controller: cubit.passwordController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'password must have value';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                state is! StoreAppUpdateProfileLoadingState
                    ? CustomloginBotton(
                        textbottom: 'update profile',
                        onpressed: () {
                          cubit.updateProfile();
                        })
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
