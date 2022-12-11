import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/controller/cubit.dart';
import 'package:store_app/controller/states.dart';
import 'package:store_app/core/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreAppCubit, StoreAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        StoreAppCubit cubit = StoreAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.cartShopping,
                      color: Colors.black54,
                    )),
              ),
            ],
            backgroundColor: Colors.white54,
            centerTitle: true,
            title: Text(
              cubit.titles[cubit.currentIndex],
              style: TextStyle(color: AppTheme.primaryColor),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.currentIndex,
            elevation: 5,
            onTap: (val) {
              cubit.changeBNB(val);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
