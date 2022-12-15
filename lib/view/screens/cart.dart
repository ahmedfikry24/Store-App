import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/controller/cubit.dart';
import 'package:store_app/controller/states.dart';
import 'package:store_app/view/widgets/cart_product_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreAppCubit, StoreAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        StoreAppCubit cubit = StoreAppCubit.get(context);
        return cubit.getcart != null
            ? ListView.separated(
                padding: const EdgeInsets.all(10),
                itemCount: cubit.getcart?['data']['cart_items'].length,
                separatorBuilder: (context, index) => Container(
                  height: 1,
                  color: Colors.grey,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
                itemBuilder: (context, index) => CustomCartProductItem(
                  getcart: cubit.getcart!,
                  index: index,
                  iscart: cubit.iscart[cubit.getcart?['data']['cart_items']
                      [index]['product']['id']]!,
                  add: () async {
                    await cubit.addCart(
                        cubit.getcart?['data']['cart_items'][index]['product']
                                ['id']
                            .toString(),
                        cubit.getcart?['data']['cart_items'][index]['product']
                            ['id']);
                    cubit.getCart();
                  },
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
