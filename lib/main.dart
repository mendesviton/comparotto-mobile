// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comparotto/app/modules/core/extensions/context_extension.dart';
import 'package:comparotto/app/modules/onboard/presentation/view/splash_page.dart';
import 'package:comparotto/app/modules/product/presentation/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:comparotto/app/modules/home/presentation/cubit/home_cubit.dart';
import 'package:comparotto/routes.dart';

import 'app/modules/core/provider/injection_container.main.dart';

Future<void> main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GetIt getIt;
  @override
  void initState() {
    getIt = GetIt.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<ProductCubit>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          primaryColor: Colors.black,
          colorScheme: context.theme.colorScheme,
          bottomSheetTheme: const BottomSheetThemeData(
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
          ),
        ),
        routes: routes,
        debugShowCheckedModeBanner: false,
        initialRoute: SplashPage.route,
      ),
    );
  }
}
