import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/Screens/FirstScreen/first_screen.dart';
import 'package:stop_and_shop/Screens/SplashScreen/splash_screen.dart';
import 'package:stop_and_shop/shared/components/components.dart';

import '../../Services/auth_service/auth.dart';
import '../../Services/local_database/shared_preferences.dart';


class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  login() async {
    await Future.delayed(const Duration(seconds: 2));
    try{
      String? email = Database.prefs.getString('email');
      String? password = Database.prefs.getString('password');
      if(email != null && password != null){
        AuthService.signIn(email: email, password: password);
      }else{
        Get.offAll(SplashScreen());
      }
    }catch (e){
      Get.offAll(SplashScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    login();
    return  Scaffold(
      body: Column(
        children:  [
          BuildLogo(),
          const Expanded(
            child:  Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
