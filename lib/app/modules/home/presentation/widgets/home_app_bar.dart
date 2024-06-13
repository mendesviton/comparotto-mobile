import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/home/presentation/cubit/home_cubit.dart';
import 'package:comparotto/app/modules/core/widgets/standard_dialog.dart';
import 'package:comparotto/app/modules/home/presentation/widgets/employee_widget.dart';
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
      leadingWidth: 150,
      leading: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Boa tarde!',
                  style: TextStyle(
                    height: 0,
                    fontSize: 17,
                    fontFamily: 'Bellfort',
                    color: Color.fromARGB(255, 195, 195, 195),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () => showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return StandardDialog(
                        standardDialogsParams: StandardDialogParams(
                          title: AppStrings.whoAreYou,
                          content: const EmployeeWidget(),
                        ),
                      );
                    },
                  ),
                  child: Text(
                    state.currentEmployee != null
                        ? state.currentEmployee!.nome!
                        : '',
                    style: const TextStyle(
                      height: 0,
                      fontSize: 25,
                      fontFamily: 'Bellfort',
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
