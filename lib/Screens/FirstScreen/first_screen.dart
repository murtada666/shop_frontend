import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_and_shop/Screens/AllScreen/AllScreen.dart';
import 'package:stop_and_shop/Screens/HomeScreen/home_screen.dart';
import 'package:stop_and_shop/shared/components/components.dart';
import 'package:stop_and_shop/style/colors.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stop_and_shop/Services/local_database/shared_preferences.dart';
import '../CheckScreens/login.dart';
import '../CheckScreens/register.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          BuildLogo(),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 550,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    width: 270,
                    height: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/img_3.png'),
                      fit: BoxFit.scaleDown,
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ContainerDesgin(
                    color: greenColor,
                    child: TextButton(
                      onPressed: () {
                        Get.to(Login());
                      },
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ContainerDesgin(
                    color: const Color(0xffF1F1F1),
                    child: TextButton(
                      onPressed: () {
                        Get.to(Signup());
                      },
                      child: Text(
                        'تسجيل',
                        style: TextStyle(
                          color: greenColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                      '__________________ او سجل دخول باستخدام __________________'),
                  const SizedBox(
                    height: 30,
                  ),
                  ContainerDesgin(
                    color: Colors.white,
                    child: TextButton(
                      onPressed: () async {
                        await _googleSignIn.signIn();
                        if (user != null) {
                          print(user.displayName);
                          print(user.email);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return AllScreen();
                          }));
                        }
                        setState(() {});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/img_1.png',
                            width: 25,
                            height: 25,
                          ),
                          Text(
                            'سجل باستخدام',
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(const AllScreen());
                      Database.prefs.setString('email', '');
                    },
                    child: const Text(
                      'تخطي الان',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
