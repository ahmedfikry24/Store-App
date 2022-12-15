// ignore_for_file: unnecessary_type_check

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/controller/states.dart';
import 'package:store_app/core/crud.dart';
import 'package:store_app/core/links_app.dart';
import 'package:store_app/services/services.dart';
import 'package:store_app/view/screens/all_products.dart';
import 'package:store_app/view/screens/cart.dart';
import 'package:store_app/view/screens/favorites.dart';

class StoreAppCubit extends Cubit<StoreAppStates> {
  StoreAppCubit() : super(StoreAppInitilaState());
  static StoreAppCubit get(context) => BlocProvider.of(context);
  Crud crud = Crud();
  Map<String, dynamic>? allProduct;
  Map<String, dynamic>? allCategories;
  Map<String, dynamic>? addfavorites;
  Map<String, dynamic>? getfavorites;
  Map<String, dynamic>? getuserinfo;
  Map<String, dynamic>? addcart;
  Map<String, dynamic>? getcart;
  Map<int, bool> isfavorite = {};
  Map<int, bool> iscart = {};
  int currentIndex = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  List<Widget> items = const [
    Icon(FontAwesomeIcons.house),
    Icon(FontAwesomeIcons.cartShopping),
    Icon(FontAwesomeIcons.heart),
  ];

  List<String> titles = [
    'New Trend',
    'Cart',
    'Favorites',
  ];

  List<Widget> screens = const [
    AllProductsScreen(),
    CartScreen(),
    FavoritesScreen(),
  ];
  changeBNB(int val) {
    currentIndex = val;
    if (val == 2 && getfavorites == null) {
      getFavorites();
    } else if (val == 1 && getcart == null) {
      getCart();
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
        iscart.addAll({element['id']: element['in_cart']});
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

  getUserInfo() async {
    emit(StoreAppGetUserInfoLoadingState());
    var response =
        await crud.getData(url: AppLinks.getuserinfo, token: Services.token);
    if (response is Map<String, dynamic>) {
      if (response['status'] == true) {
        getuserinfo = response;
        emit(StoreAppGetUserInfoSuccessState());
      } else {
        emit(StoreAppGetUserInfoErrorState());
      }
    } else {
      emit(StoreAppGetUserInfoErrorState());
    }
  }

  updateProfile() async {
    if (globalKey.currentState!.validate()) {
      emit(StoreAppUpdateProfileLoadingState());
      var response = await crud.putData(
        url: AppLinks.updateprofile,
        token: Services.token!,
        data: {
          'name': nameController.text,
          'email': emailController.text,
          'phone': phoneController.text,
          'password': passwordController.text,
        },
      );
      if (response is Map<String, dynamic>) {
        if (response['status'] == true) {
          emit(StoreAppUpdateProfileSuccessState());
          getUserInfo();
        } else {
          emit(StoreAppUpdateProfileErrorState());
        }
      } else {
        emit(StoreAppUpdateProfileErrorState());
      }
    }
  }

  addCart(String? id, int idis) async {
    iscart[idis] = !iscart[idis]!;
    emit(StoreAppAddCartLoadingState());
    var response = await crud.postData(
      url: AppLinks.addcart,
      data: {
        'product_id': id,
      },
      token: Services.token,
    );
    if (response is Map<String, dynamic>) {
      if (response['status'] == true) {
        addcart = response;
        if (getcart != null) {
          getCart();
        }
        emit(StoreAppAddCartSuccessState());
      } else {
        iscart[idis] = !iscart[idis]!;
        emit(StoreAppAddCartErrorState());
      }
    } else {
      iscart[idis] = !iscart[idis]!;
      emit(StoreAppAddCartErrorState());
    }
  }

  getCart() async {
    emit(StoreAppGetCartLoadingState());
    var response =
        await crud.getData(url: AppLinks.addcart, token: Services.token);
    if (response is Map<String, dynamic>) {
      if (response['status'] == true) {
        getcart = response;
        emit(StoreAppGetCartSuccessState());
      } else {
        emit(StoreAppGetCartErrorState());
      }
    } else {
      emit(StoreAppGetCartErrorState());
    }
  }
}
