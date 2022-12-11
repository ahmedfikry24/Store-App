// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/controller/states.dart';
import 'package:store_app/services/all_products.dart';
import 'package:store_app/view/screens/all_products.dart';

class StoreAppCubit extends Cubit<StoreAppStates> {
  StoreAppCubit() : super(StoreAppInitilaState());
  static StoreAppCubit get(context) => BlocProvider.of(context);
  AllProducts allProductsRequest = AllProducts();
  List<dynamic>? allProduct;

  int currentIndex = 0;
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.house),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.list),
      label: 'categories',
    ),
    const BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.heart),
      label: 'favorites',
    ),
  ];

  List<String> titles = [
    'New Trend',
    'All Categories',
    'Favorites',
  ];

  List<Widget> screens = [
    AllProductsScreen(),
  ];
  changeBNB(int val) {
    currentIndex = val;
    emit(StoreAppChangeBNBState());
  }

  getAllProduct() async {
    emit(StoreAppGetAllProductLoadingState());
    var response = await allProductsRequest.getData();
    if (response is List<dynamic>) {
      allProduct = response;
      emit(StoreAppGetAllProductSuccessState());
    } else {
      emit(StoreAppGetAllProductErrorState());
    }
  }
}
