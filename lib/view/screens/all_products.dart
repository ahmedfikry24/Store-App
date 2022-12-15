import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/controller/cubit.dart';
import 'package:store_app/controller/states.dart';
import 'package:store_app/view/widgets/product_item.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreAppCubit, StoreAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        StoreAppCubit cubit = StoreAppCubit.get(context);
        return cubit.allProduct != null
            ? ListView(
                children: [
                  CarouselSlider.builder(
                    itemCount: cubit.allProduct?['data']['banners'].length,
                    itemBuilder: (context, index, realIndex) => ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        cubit.allProduct?['data']['banners'][index]['image'],
                        fit: BoxFit.fill,
                      ),
                    ),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 3),
                      autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                      autoPlayInterval: const Duration(seconds: 5),
                      height: 300,
                      reverse: true,
                      viewportFraction: 1,
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Text(
                      'New Products ',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GridView.builder(
                      itemCount: cubit.allProduct?['data']['products'].length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: .95,
                      ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CustomProductItem(
                          allProducts: cubit.allProduct!,
                          index: index,
                          favorites: () {
                            cubit.addFavorites(
                                cubit.allProduct?['data']['products'][index]
                                        ['id']
                                    .toString(),
                                cubit.allProduct?['data']['products'][index]
                                    ['id']);
                          },
                          add: () {
                            cubit.addCart(
                                cubit.allProduct?['data']['products'][index]
                                        ['id']
                                    .toString(),
                                cubit.allProduct?['data']['products'][index]
                                    ['id']);
                          },
                          isFavorites: cubit.isfavorite[cubit
                              .allProduct?['data']['products'][index]['id']]!,
                          iscart: cubit.iscart[cubit.allProduct?['data']
                              ['products'][index]['id']]!,
                        );
                      },
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
