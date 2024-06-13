import 'package:comparotto/app/modules/home/presentation/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  static const String route = '/';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _loadNextScreen(context);
  }

  void _loadNextScreen(BuildContext context) async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          Navigator.of(context).pushReplacementNamed(
            HomePage.route,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: SvgPicture.asset(
                'assets/icons/logo.svg',
                height: 150,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'RESTAURANTE \n    COMPAROTTO',
                style: TextStyle(
                  height: 0,
                  fontSize: 36,
                  fontFamily: 'Bellfort',
                  color: Color(0xFF036A33),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
