import 'package:comparotto/app/modules/core/res/app_image_assets.dart';
import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/widgets/standard_button.dart';
import 'package:comparotto/app/modules/core/widgets/standard_circular_progress_indicator.dart';
import 'package:comparotto/app/modules/core/widgets/standard_dialog.dart';
import 'package:comparotto/app/modules/core/extensions/context_extension.dart';
import 'package:comparotto/app/modules/home/presentation/cubit/home_cubit.dart';
import 'package:comparotto/app/modules/home/presentation/widgets/insert_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class EmployeeListWidget extends StatelessWidget {
  const EmployeeListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetEmployeesError) {
          return SizedBox(
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SvgPicture.asset(
                      AppIconAssets.sadFace,
                    ),
                  ),
                  Text(
                    'Ops, algo deu errado!',
                    style: context.theme.textTheme.mediumBlackBoldTextStyle,
                  ),
                  StandardButton(
                    text: 'Tentar novamente',
                    onPressed: () =>
                        BlocProvider.of<HomeCubit>(context).getEmployees(),
                  )
                ],
              ));
        }
        if (state is GetEmployeesLoading) {
          return const SizedBox(
            height: 200,
            child: StandardCircularProgressIndicator(),
          );
        }
        return SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: state.employeesList?.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                BlocProvider.of<HomeCubit>(context)
                    .setCurrentEmplooye(state.employeesList![index]);

                Navigator.of(context).pop();
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  barrierColor: Colors.transparent.withOpacity(0.2),
                  builder: (context) {
                    return StandardDialog(
                      standardDialogsParams: StandardDialogParams(
                        title: AppStrings.insertYourPassword,
                        content: const InsertPasswordWidget(),
                      ),
                    );
                  },
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              state.employeesList![index].urlImage!,
                            ),
                            radius: 30,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.employeesList![index].name!.firstName,
                              style:
                                  context.theme.textTheme.small18BlackTextStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Divider(
                      thickness: 0,
                      color: Color.fromARGB(255, 195, 195, 195),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
