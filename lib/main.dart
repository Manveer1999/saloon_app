import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider_demo/Screens/IntroSlider.dart';
import 'package:intro_slider_demo/Screens/MyLoginPage.dart';

import 'CustomWidgets/CustomButtons.dart';
import 'CustomWidgets/CustomTextWidget.dart';

const Color PINK= Color(0xffFF7374);
const Color GREY=Color.fromRGBO(152, 153, 166,1);
const Color DARK_GREY=Color.fromRGBO(90, 92, 113,1);
Color WHITE = Colors.white;
Color BLACK = Colors.black;
Color LIGHT_GREY = Color.fromRGBO(229,243, 207,1);
Color HOME_BG = Color.fromRGBO(245, 249, 255, 1);
Color RED = Color.fromRGBO(255, 14, 14, 1);
Color RED_LIGHT = Color.fromRGBO(236, 175, 196, 1.0);
Color DIVIDER_BG = Color.fromRGBO(234, 234, 234, 1);

Color BLUE = Color.fromRGBO(138, 152, 202, 1.0);
Color LIGHT_GREEN_BG = Color(0xFFF5F9FF);
Color YELLOW= Colors.amber.shade500;

CustomTextWidget ct = CustomTextWidget();
CustomButtons cb = CustomButtons();

String LANGUAGE_TYPE = "en";


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();


  runApp(
    MaterialApp(
      home: MyLoginScreen(),
      theme: ThemeData(
        accentColor: PINK.withOpacity(0.2),
      ),
    )
  );
}
