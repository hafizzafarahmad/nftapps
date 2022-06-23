import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nftapps/core/styles/button_apps_style.dart';
import 'package:nftapps/core/styles/input_apps_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/color_apps.dart';
import '../../../../core/styles/size_apps.dart';
import '../../../../core/widget/button_widget.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _obscureText = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameInput = TextEditingController();
  final TextEditingController _passwordInput = TextEditingController();

  Future<void> _login() async {
    context.read<AuthBloc>().add(LoginEvent());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _usernameInput.dispose();
    _passwordInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: SizeApps.height(context, size: 1),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  Image.asset("assets/fingerprint.png", width: SizeApps.width(context, size: 0.2),),
                  const SizedBox(height: 20,),
                  Text("SIGN IN",
                    style: TextStyle(
                        fontSize:  SizeApps.width(context, size: 0.04)
                    ),
                  ),
                  Text("TO CONTINUE",
                    style: TextStyle(
                        fontSize:  SizeApps.width(context, size: 0.04)
                    ),
                  ),
                  const SizedBox(height: 60,),

                  ///Input Email
                  TextFormField(
                    controller: _usernameInput,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.left,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Email cannot be blank";
                      }
                      return null;
                    },
                    decoration: InputAppsStyle.textField(hint: "Email"),
                  ),
                  const SizedBox(height: 15,),

                  ///Input Password
                  TextFormField(
                    controller: _passwordInput,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    textAlign: TextAlign.left,
                    obscureText: _obscureText,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password cannot be blank";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorApps.lightGrey,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 25.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        hintText: "Password",
                        suffixIcon: IconButton(
                            icon: _obscureText == true
                                ? Icon(
                              Icons.visibility_off_outlined,
                              color: ColorApps.primaryColor,
                            )
                                : Icon(
                              Icons.visibility_outlined,
                              color: ColorApps.primaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            })
                    ),
                  ),

                  const SizedBox(height: 30,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: SizeApps.width(context, size: 0.5),
                    child: ButtonWidget.submit(
                      onPress: (){
                        if(_formKey.currentState!.validate()){
                          _login();
                        }
                      },
                      text: "Log in",
                      fontSize: 18),
                  ),
                  const SizedBox(height: 20,),

                  ///forgot password
                  Text("Forgot Password?",
                    style: TextStyle(
                        fontSize:  SizeApps.width(context, size: 0.035)
                    ),
                  ),

                  const SizedBox(height: 50,),

                  ///login with google or facebook
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: SizeApps.width(context, size: 0.35),
                        child: ElevatedButton(
                          onPressed: () {
                            // _signIn();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            side:  BorderSide(width: 2, color: ColorApps.primaryColor,),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25),)
                            ),
                            primary: Colors.white,
                            shadowColor: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.google, color: ColorApps.primaryColor, size: 18,),
                              const SizedBox(width: 8,),
                              const Text("Google",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeApps.width(context, size: 0.35),
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            side:  BorderSide(width: 2, color: ColorApps.primaryColor,),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25),)
                            ),
                            primary: Colors.white,
                            shadowColor: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.facebook, color: ColorApps.primaryColor, size: 18,),
                              const SizedBox(width: 8,),
                              const Text("Facebook",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            )
        ),
      )
    );
  }
}
