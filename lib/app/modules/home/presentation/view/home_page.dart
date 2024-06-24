// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:comparotto/app/modules/home/data/model/home_models.dart';
import 'package:comparotto/app/modules/product/presentation/view/create_product_registration_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/widgets/standard_dialog.dart';
import 'package:comparotto/app/modules/core/extensions/context_extension.dart';
import 'package:comparotto/app/modules/home/presentation/cubit/home_cubit.dart';
import 'package:comparotto/app/modules/home/presentation/widgets/employee_list_widget.dart';
import 'package:comparotto/app/modules/home/presentation/widgets/home_app_bar.dart';
import 'package:comparotto/app/modules/home/presentation/widgets/home_button.dart';
import 'package:comparotto/app/modules/home/presentation/widgets/release_list.dart';

import '../../../core/widgets/standard_bottom_sheet.dart';

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
          barrierColor: Colors.transparent.withOpacity(0.2),
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return StandardDialog(
              standardDialogsParams: StandardDialogParams(
                content: const EmployeeListWidget(),
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
    List<HomeButtonModel> homeButtonList = [
      HomeButtonModel(
          standardBottomSheetParams: StandardBottomSheetParams(
              content: 'Qual operação você deseja fazer?',
              title: 'Produtos',
              standardBottomSheetButtonContenParamsList: [
                StandardBottomSheetButtonParams(
                  title: 'Criar produto',
                  color: const Color(0xFF5DB075),
                  onPressed: () => Navigator.of(context).pushReplacementNamed(
                    CreateProductRegistrationData.route,
                  ),
                ),
                StandardBottomSheetButtonParams(
                  title: 'Ver meus produtos',
                  color: const Color(0xFF0094FF),
                  onPressed: () => print('ai meu piru'),
                ),
              ]),
          textColor: const Color(0xfff0094ff),
          urlImage: 'assets/icons/produto.svg',
          title: 'Produtos',
          color: const Color(0xFFD7ECFF)),
      HomeButtonModel(
          standardBottomSheetParams: StandardBottomSheetParams(
              content: 'Qual operação você deseja fazer?',
              title: 'Pratos',
              standardBottomSheetButtonContenParamsList: [
                StandardBottomSheetButtonParams(
                  title: 'Criar prato',
                  color: const Color(0xFF5DB075),
                  onPressed: () => print('ai meu piru'),
                ),
                StandardBottomSheetButtonParams(
                  title: 'Ver meus pratos',
                  color: const Color(0xFF0094FF),
                  onPressed: () => print('ai meu piru'),
                ),
              ]),
          textColor: const Color(0xFFFF8A00),
          urlImage: 'assets/icons/pratos.svg',
          title: 'Pratos',
          color: const Color(0xFFF6E5BB)),
      HomeButtonModel(
          standardBottomSheetParams: StandardBottomSheetParams(
              content: 'Qual operação você deseja fazer?',
              title: 'Estoque',
              standardBottomSheetButtonContenParamsList: [
                StandardBottomSheetButtonParams(
                  title: 'Ajustar estoque',
                  color: const Color(0xFF5DB075),
                  onPressed: () => print('ai meu piru'),
                ),
                StandardBottomSheetButtonParams(
                  title: 'Histórico de entradas e saídas',
                  color: const Color(0xFF0094FF),
                  onPressed: () => Navigator.of(context).pushReplacementNamed(
                    HomePage.route,
                  ),
                ),
              ]),
          textColor: const Color(0xFFFF1000),
          urlImage: 'assets/icons/estoque.svg',
          title: 'Estoque',
          color: const Color(0xFFFFDCD7)),
      HomeButtonModel(
          standardBottomSheetParams: StandardBottomSheetParams(
              content: 'Qual operação você deseja fazer?',
              title: 'Estatisticas',
              standardBottomSheetButtonContenParamsList: [
                StandardBottomSheetButtonParams(
                  title: 'Projeção de valores',
                  color: const Color(0xFF5DB075),
                  onPressed: () => print('ai meu piru'),
                ),
                StandardBottomSheetButtonParams(
                  title: 'Relatório de vendas',
                  color: const Color(0xFF0094FF),
                  onPressed: () => print('ai meu piru'),
                ),
              ]),
          textColor: const Color(0xFF016B32),
          urlImage: 'assets/icons/estatisticas.svg',
          title: 'Estatisticas',
          color: const Color(0xFFE1F8BC)),
    ];
    return Scaffold(
      bottomNavigationBar:
          BottomNavigationBar(currentIndex: 2, elevation: 2, items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.barcode_reader),
            label: 'Ler código',
            backgroundColor: Colors.red),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
        BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on), label: 'Saída'),
      ]),
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Selecione uma opcão:',
                  style: context.theme.textTheme.mediumBlackTextStyle),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 1.1,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ultimas entradas e saídas:',
                        style: context.theme.textTheme.mediumBlackTextStyle),
                    Text('ver tudo',
                        style: context.theme.textTheme.smallGreyTextStyle),
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
