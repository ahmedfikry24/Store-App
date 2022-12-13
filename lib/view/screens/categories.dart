import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/controller/cubit.dart';
import 'package:store_app/controller/states.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreAppCubit, StoreAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        StoreAppCubit cubit = StoreAppCubit.get(context);
        return cubit.allCategories != null
            ? Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.separated(
                  itemCount: cubit.allCategories?['data']['data'].length,
                  separatorBuilder: (context, index) => Container(
                    height: 1,
                    color: Colors.grey,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                  ),
                  itemBuilder: (context, index) => Row(
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        margin: const EdgeInsets.all(10),
                        child: Image.network(
                          cubit.allCategories?['data']['data'][index]['image'],
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        cubit.allCategories?['data']['data'][index]['name'],
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
