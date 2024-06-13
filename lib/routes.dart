import 'package:comparotto/app/modules/home/presentation/view/home_page.dart';
import 'package:comparotto/app/modules/onboard/presentation/view/splash_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.route: (context) => const SplashPage(),
  HomePage.route: (context) => const HomePage(),
};
