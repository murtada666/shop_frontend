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
      String? phoneNumber = Database.prefs.getString('phoneNumber');
      String? password = Database.prefs.getString('password');
      if(phoneNumber != null && password != null){
        AuthService.signIn(phoneNumber: phoneNumber, password: password);
      }else{
        Get.offAll(FirstScreen());
      }
    }catch (e){
      Get.offAll(FirstScreen());
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
