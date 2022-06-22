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
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  ///to get encryption Key
  // final key = await secureStorage.read(key: 'encryptionKey');
  // Uint8List encryptionKey = base64Url.decode(key!);

  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => encryptionKey);

  ///BLOC ------------------------------------------------------------------
  ///AUTH
  sl.registerFactory(() => AuthBloc(sharedPreferences: sl()));


  ///USE CASE ------------------------------------------------------------------


  /// REPOSITORY ---------------------------------------------------------------


  ///DATA SOURCES LOCAL--------------------------------------------------------------


}
