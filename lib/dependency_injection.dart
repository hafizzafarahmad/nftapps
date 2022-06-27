import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  ///BLOC ------------------------------------------------------------------
  ///AUTH
  sl.registerFactory(() => AuthBloc(sharedPreferences: sl()));


  ///USE CASE ------------------------------------------------------------------


  /// REPOSITORY ---------------------------------------------------------------


  ///DATA SOURCES Remote and Local --------------------------------------------------------------


}
