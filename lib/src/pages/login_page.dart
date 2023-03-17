import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gaviota_app/src/requests/authentication.dart';
import 'package:gaviota_app/src/shared_preferences/shared_preferences.dart';
import 'package:gaviota_app/src/utils/custom_login_messages.dart';

import '../../main.dart';
import '../models/login_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginModel model = LoginModel(error: "", token: "", user: "", rol: "");
    return FlutterLogin(
      userType: LoginUserType.name,
      title: null,
      logo: "assets/icon/login_icon.png",
      hideForgotPasswordButton: true,
      userValidator:(data) => null,
      passwordValidator: (data) => null,
      onLogin: (data)async {
        model = await Authentication().Login(data.name, data.password);
        if (model.token == ""){
          Fluttertoast.showToast(
              msg: model.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }else {
          LocalStorage.prefs.setString("token", model.token);
          LocalStorage.prefs.setString("user", model.user);
          LocalStorage.prefs.setString("rol", model.rol);
          token = model.token;
        }
      },
      onSignup: null,
      messages: CustomLoginMessages().loginMessages,
      onSubmitAnimationCompleted: (){
        if (model.token == ""){
          Navigator.pushReplacementNamed(context, "login");
        }else {
          Navigator.pushReplacementNamed(context, "dailyGaviota");
        }
      },
      onRecoverPassword: (_) => null,
      theme: LoginTheme(
        buttonTheme: const LoginButtonTheme(
          backgroundColor: Color(0xFF0099cc)
        )
      ),
    );
  }
}
