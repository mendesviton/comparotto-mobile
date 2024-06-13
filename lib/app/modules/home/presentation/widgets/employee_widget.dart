import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/validator/name_input_formatter.dart';
import 'package:comparotto/app/modules/core/validator/password_input_formatter.dart';
import 'package:comparotto/app/modules/core/widgets/standard_button.dart';
import 'package:comparotto/app/modules/core/widgets/standard_dialog.dart';
import 'package:comparotto/app/modules/core/widgets/stardard_text_field.dart';
import 'package:comparotto/app/modules/extensions/context_extension.dart';
import 'package:comparotto/app/modules/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeWidget extends StatelessWidget {
  const EmployeeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetEmployeesSuccess) {
          return Expanded(
            // height: context.width * 0.45,
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
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              StandardTextField(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  shouldValidate: false,
                                  compoundableFormatter:
                                      PasswordInputFormatter(),
                                  controller: TextEditingController()),
                              const StandardButton(text: AppStrings.enter)
                            ],
                          ),
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
                          const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                //TODO jogar para image strings
                                'assets/images/image.png',
                              ),
                              radius: 30,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.employeesList![index].nome!,
                                style: context
                                    .theme.textTheme.small18BlackTextStyle,
                              ),
                              Text(state.employeesList![index].nome!,
                                  style: context
                                      .theme.textTheme.smallGreyTextStyle),
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
        } else {
          return const Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: SizedBox(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF036A33)),
                    strokeWidth: 8,
                    strokeCap: StrokeCap.round,
                    backgroundColor: Color(0xFFD2D8D7),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
