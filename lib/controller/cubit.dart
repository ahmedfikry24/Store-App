// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/controller/states.dart';
import 'package:store_app/core/crud.dart';
import 'package:store_app/core/links_app.dart';
import 'package:store_app/services/services.dart';
import 'package:store_app/view/screens/all_products.dart';

class StoreAppCubit extends Cubit<StoreAppStates> {
  StoreAppCubit() : super(StoreAppInitilaState());
  static StoreAppCubit get(context) => BlocProvider.of(context);
  Crud crud = Crud();
  Map<String, dynamic>? allProduct;

  int currentIndex = 0;
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.house),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.heart),
      label: 'favorites',
    ),
    const BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.list),
      label: 'categories',
    ),
  ];

  List<String> titles = [
    'New Trend',
    'Favorites',
    'All Categories',
  ];

  List<Widget> screens = const [
    AllProductsScreen(),
  ];
  changeBNB(int val) {
    currentIndex = val;
    emit(StoreAppChangeBNBState());
  }

  getAllProduct() async {
    emit(StoreAppGetAllProductLoadingState());
    var response =
        await crud.getData(url: AppLinks.getAllProducts, token: Services.token);
    if (response is Map<String, dynamic>) {
      allProduct = response;
      emit(StoreAppGetAllProductSuccessState());
    } else {
      emit(StoreAppGetAllProductErrorState());
    }
  }
}
