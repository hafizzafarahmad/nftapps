import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nftapps/features/auth/presentation/pages/index_auth.dart';
import 'package:pigment/pigment.dart';

import 'core/styles/color_apps.dart';
import 'dependency_injection.dart' as di;
import 'dependency_injection.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //initial dependency injection
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (BuildContext context) => sl<AuthBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NFTs Art',
          theme: ThemeData(
            primaryColor: ColorApps.primaryColor,
          ),
          home: const IndexAuth(),
        ));
  }
}
