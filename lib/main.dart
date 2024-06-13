// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comparotto/app/modules/onboard/presentation/view/splash_page.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GetIt getIt = GetIt.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<HomeCubit>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            bottomSheetTheme: const BottomSheetThemeData(
                surfaceTintColor: Colors.white, backgroundColor: Colors.white)),
        routes: routes,
        debugShowCheckedModeBanner: false,
        initialRoute: SplashPage.route,
      ),
    );
  }
}
