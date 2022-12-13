// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/controller/states.dart';
import 'package:store_app/core/crud.dart';
import 'package:store_app/core/links_app.dart';
import 'package:store_app/services/services.dart';
import 'package:store_app/view/screens/all_products.dart';
import 'package:store_app/view/screens/categories.dart';
import 'package:store_app/view/screens/favorites.dart';

class StoreAppCubit extends Cubit<StoreAppStates> {
  StoreAppCubit() : super(StoreAppInitilaState());
  static StoreAppCubit get(context) => BlocProvider.of(context);
  Crud crud = Crud();
  Map<String, dynamic>? allProduct;
  Map<String, dynamic>? allCategories;
  Map<String, dynamic>? addfavorites;
  Map<String, dynamic>? getfavorites;
  Map<int, bool> isfavorite = {};
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
    FavoritesScreen(),
    CategoriesScreen()
  ];
  changeBNB(int val) {
    currentIndex = val;
    if (val == 2 && allCategories == null) {
      getCategories();
    } else if (val == 1 && getfavorites == null) {
      getFavorites();
    }
    emit(StoreAppChangeBNBState());
  }

  getAllProduct() async {
    emit(StoreAppGetAllProductLoadingState());
    var response =
        await crud.getData(url: AppLinks.getAllProducts, token: Services.token);
    if (response is Map<String, dynamic>) {
      allProduct = response;
      allProduct?['data']['products'].forEach((element) {
        isfavorite.addAll({element['id']: element['in_favorites']});
      });
      emit(StoreAppGetAllProductSuccessState());
    } else {
      emit(StoreAppGetAllProductErrorState());
    }
  }

  getCategories() async {
    emit(StoreAppGetCategoriesLoadingState());
    var response = await crud.getData(url: AppLinks.getAllCategories);
    if (response is Map<String, dynamic>) {
      allCategories = response;
      emit(StoreAppGetCategoriesSuccessState());
    } else {
      emit(StoreAppGetCategoriesErrorState());
    }
  }

  addFavorites(String? id, int idis) async {
    isfavorite[idis] = !isfavorite[idis]!;
    emit(StoreAppAddFavoritesLoadingState());
    var response = await crud.postData(
      url: AppLinks.addFavorites,
      data: {
        'product_id': id,
      },
      token: Services.token,
    );
    if (response is Map<String, dynamic>) {
      if (response['status'] == true) {
        addfavorites = response;
        if (getfavorites != null) {
          getFavorites();
        }
        emit(StoreAppAddFavoritesSuccessState());
      } else {
        isfavorite[idis] = !isfavorite[idis]!;
        emit(StoreAppAddFavoritesErrorState());
      }
    } else {
      isfavorite[idis] = !isfavorite[idis]!;
      emit(StoreAppAddFavoritesErrorState());
    }
  }

  getFavorites() async {
    emit(StoreAppGetFavoritesLoadingState());
    var response =
        await crud.getData(url: AppLinks.addFavorites, token: Services.token);
    if (response is Map<String, dynamic>) {
      if (response['status'] == true) {
        getfavorites = response;
        emit(StoreAppGetFavoritesSuccessState());
      } else {
        emit(StoreAppGetFavoritesErrorState());
      }
    } else {
      emit(StoreAppGetFavoritesErrorState());
    }
  }
}
