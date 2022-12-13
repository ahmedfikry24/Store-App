import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/controller/cubit.dart';
import 'package:store_app/controller/states.dart';
import 'package:store_app/core/themes.dart';
import 'package:store_app/view/screens/profile.dart';
import 'package:store_app/view/screens/settings.dart';

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
            iconTheme: const IconThemeData(color: Colors.black54),
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.cartShopping,
                    )),
              ),
            ],
            backgroundColor: Colors.white54,
            centerTitle: true,
            title: Text(cubit.titles[cubit.currentIndex],
                style: TextStyle(color: AppTheme.primaryColor)),
          ),
          drawer: cubit.getuserinfo != null
              ? Drawer(
                  child: ListView(children: [
                    UserAccountsDrawerHeader(
                      accountEmail: Text(cubit.getuserinfo?['data']['email']),
                      accountName: Text(cubit.getuserinfo?['data']['name']),
                      currentAccountPicture: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child:
                            Image.network(cubit.getuserinfo?['data']['image']),
                      ),
                    ),
                    ListTile(
                      title: const Text('profile'),
                      leading: const Icon(Icons.person),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ));
                      },
                    ),
                    ListTile(
                      title: const Text('settings'),
                      leading: const Icon(Icons.settings),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingsScreen(),
                            ));
                      },
                    ),
                    ListTile(
                      title: const Text('logout'),
                      leading: const Icon(Icons.logout_outlined),
                      onTap: () {},
                    ),
                  ]),
                )
              : const SizedBox.shrink(),
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
