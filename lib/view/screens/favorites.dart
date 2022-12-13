import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/controller/cubit.dart';
import 'package:store_app/controller/states.dart';
import 'package:store_app/view/widgets/favorite_product_item.dart';
import 'package:store_app/view/widgets/product_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreAppCubit, StoreAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        StoreAppCubit cubit = StoreAppCubit.get(context);
        return cubit.getfavorites != null
            ? ListView.separated(
                padding: const EdgeInsets.all(10),
                itemCount: cubit.getfavorites?['data']['data'].length,
                separatorBuilder: (context, index) => Container(
                  height: 1,
                  color: Colors.grey,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
                itemBuilder: (context, index) => CustomFavoriteProductItem(
                  getfavorites: cubit.getfavorites!,
                  index: index,
                  isFavorites: cubit.isfavorite[cubit.getfavorites?['data']
                      ['data'][index]['product']['id']]!,
                  favorites: () async {
                    await cubit.addFavorites(
                        cubit.getfavorites?['data']['data'][index]['product']
                                ['id']
                            .toString(),
                        cubit.getfavorites?['data']['data'][index]['product']
                            ['id']);
                    cubit.getFavorites();
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
