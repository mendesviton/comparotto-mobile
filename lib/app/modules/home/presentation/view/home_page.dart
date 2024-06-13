import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/home/presentation/cubit/home_cubit.dart';
import 'package:comparotto/app/modules/home/presentation/widgets/employee_widget.dart';
import 'package:comparotto/app/modules/home/presentation/widgets/home_app_bar.dart';
import 'package:comparotto/app/modules/home/presentation/widgets/home_button.dart';
import 'package:comparotto/app/modules/home/presentation/widgets/release_list.dart';
import 'package:comparotto/app/modules/core/widgets/standard_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<HomeButtonModel> homeButtonList = [
  HomeButtonModel(
      urlImage: 'assets/icons/produto.svg',
      title: 'Produtos',
      color: const Color(0xFFD7ECFF)),
  HomeButtonModel(
      urlImage: 'assets/icons/pratos.svg',
      title: 'Pratos',
      color: const Color(0xFFF6E5BB)),
  HomeButtonModel(
      urlImage: 'assets/icons/estoque.svg',
      title: 'Estoque',
      color: const Color(0xFFFFDCD7)),
  HomeButtonModel(
      urlImage: 'assets/icons/estatisticas.svg',
      title: 'Estatisticas',
      color: const Color(0xFFE1F8BC)),
];

class HomeButtonModel {
  String urlImage;
  String title;
  Color color;
  HomeButtonModel({
    required this.color,
    required this.urlImage,
    required this.title,
  });
}

class HomePage extends StatefulWidget {
  static String route = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getEmployees();
    _loadNextScreen(context);
  }

  void _loadNextScreen(BuildContext context) async {
    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return StandardDialog(
              standardDialogsParams: StandardDialogParams(
                content: const EmployeeWidget(),
                title: AppStrings.whoAreYou,
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Selecione uma opcão:',
                style: TextStyle(
                  height: 0,
                  fontSize: 18,
                  fontFamily: 'Bellfort',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.47,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: homeButtonList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                      left: index % 2 == 0 ? 20 : 10,
                      right: index % 2 == 0 ? 10 : 20),
                  child: HomeButton(
                    buttonModel: homeButtonList[index],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ultimas entradas e saídas:',
                        style: TextStyle(
                          height: 0,
                          fontSize: 18,
                          fontFamily: 'Bellfort',
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        )),
                    Text('ver tudo',
                        style: TextStyle(
                          height: 0,
                          fontSize: 18,
                          fontFamily: 'Bellfort',
                          color: Color.fromARGB(255, 176, 176, 176),
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
            ),
            const ReleaseList(),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
