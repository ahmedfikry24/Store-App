// ignore_for_file: unnecessary_type_check
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/controller/login/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitilaState());
  static LoginCubit get(context) => BlocProvider.of(context);
}
