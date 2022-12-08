// ignore_for_file: unnecessary_type_check

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/controller/states.dart';
import 'package:store_app/services/all_products.dart';

class StoreAppCubit extends Cubit<StoreAppStates> {
  StoreAppCubit() : super(StoreAppInitilaState());
  static StoreAppCubit get(context) => BlocProvider.of(context);
  AllProducts allProductsRequest = AllProducts();
  List<dynamic>? allProduct;

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
