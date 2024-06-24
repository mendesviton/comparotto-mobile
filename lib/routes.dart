import 'package:comparotto/app/modules/home/presentation/view/home_page.dart';
import 'package:comparotto/app/modules/onboard/presentation/view/splash_page.dart';
import 'package:comparotto/app/modules/product/presentation/view/create_product_details.dart';
import 'package:comparotto/app/modules/product/presentation/view/create_product_registration_data.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.route: (context) => const SplashPage(),
  HomePage.route: (context) => const HomePage(),
  CreateProductRegistrationData.route: (context) =>
      const CreateProductRegistrationData(),
  CreateProductDetails.route: (context) => const CreateProductDetails()
};
