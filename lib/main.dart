// @dart=2.9
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AuthScreens/login_screen.dart';
import 'StudentsPageSection/BottomNaBar.dart';
import 'StudentsPageSection/ChoiceTypeBac.dart';
import 'StudentsPageSection/Accueil.dart';
import 'StudentsPageSection/MatieresTypeBac/PageMatieresS.dart';
import 'onboarding_sceens/onboarding_screen.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bac++',
      home: AnimatedSplashScreen(
        animationDuration: Duration(seconds: 1),
        splash:
            Container(
                child: Image.asset('assets/logoSplash.png')),
        nextScreen: OnboardingScreen(),
        splashTransition: SplashTransition.sizeTransition,),

            );

  }
}


