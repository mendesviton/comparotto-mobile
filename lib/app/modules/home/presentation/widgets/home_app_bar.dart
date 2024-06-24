import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/extensions/context_extension.dart';
import 'package:comparotto/app/modules/home/presentation/cubit/home_cubit.dart';
import 'package:comparotto/app/modules/core/widgets/standard_dialog.dart';
import 'package:comparotto/app/modules/home/presentation/widgets/employee_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SvgPicture.asset(
            'assets/icons/logo.svg',
            height: 45,
          ),
        )
      ],
      toolbarHeight: 100,
      leadingWidth: 200,
      leading: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      state.currentEmployee?.urlImage ??
                          'https://img.freepik.com/vetores-premium/icones-do-botao-liga-desliga-vermelho-ligado-e-desligado-iniciar-o-botao-liga-desliga-vetor-ilustracao-stock_100456-11563.jpg',
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Boa tarde!',
                        style: context.theme.textTheme.smallGreyTextStyle),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<HomeCubit>(context).getEmployees();
                        showDialog(
                          barrierColor: Colors.transparent.withOpacity(0.2),
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return StandardDialog(
                              standardDialogsParams: StandardDialogParams(
                                title: AppStrings.whoAreYou,
                                content: const EmployeeListWidget(),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                          state.currentEmployee != null
                              ? state.currentEmployee!.name!.firstName
                              : '',
                          style: context.theme.textTheme.mediumBlackTextStyle
                              .copyWith(fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 80);
}
