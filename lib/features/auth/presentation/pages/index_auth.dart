
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nftapps/features/home/presentation/home_page.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'intro_page.dart';
import 'login_page.dart';
import 'splash_screen_page.dart';

class IndexAuth extends StatefulWidget {
  const IndexAuth({Key? key}) : super(key: key);

  @override
  _IndexAuthState createState() => _IndexAuthState();
}

class _IndexAuthState extends State<IndexAuth> {

  @override
  void initState() {
    super.initState();
    //initial when app started
    context.read<AuthBloc>().add(AppStarted(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitialized) {
          //splashscreen
          return const SplashScreenPage();
        } else if (state is AuthIntro) {
          //intro if new installed
          return const IntroPage();
        } else if (state is NeedAuthenticated) {
          //AuthScreen
          return const LoginPage();
        }  else if (state is Authenticated) {
          //if authenticated
          return const HomePage();
        } else {
          return Container();
        }
      },
    );  }
}
