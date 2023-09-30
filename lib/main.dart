import 'package:final_practical_exam/views/screens/homePage.dart';
import 'package:final_practical_exam/views/screens/quotesPaage.dart';
import 'package:final_practical_exam/views/screens/spashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/quotes',
          page: () => QuotesPage(),
        )
      ],
    ),
  );
}
