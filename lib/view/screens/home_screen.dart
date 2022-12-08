import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/controller/cubit.dart';
import 'package:store_app/controller/states.dart';
import 'package:store_app/core/themes.dart';
import 'package:store_app/view/widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreAppCubit(),
      child: BlocConsumer<StoreAppCubit, StoreAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          StoreAppCubit cubit = StoreAppCubit();
          print(cubit.allProduct);
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
                )
              ],
              backgroundColor: Colors.white54,
              centerTitle: true,
              title: Text(
                'New Trend',
                style: TextStyle(color: AppTheme.primaryColor),
              ),
            ),
            body: cubit.allProduct != null
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: GridView.builder(
                      itemCount: 2,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: .95,
                      ),
                      itemBuilder: (context, index) {
                        return CustomProductItem();
                      },
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}
