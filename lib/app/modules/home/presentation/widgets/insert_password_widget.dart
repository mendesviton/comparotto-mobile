import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:comparotto/app/modules/core/res/app_strings.dart';
import 'package:comparotto/app/modules/core/validator/password_input_formatter.dart';
import 'package:comparotto/app/modules/core/widgets/standard_button.dart';
import 'package:comparotto/app/modules/core/widgets/standard_dialog.dart';
import 'package:comparotto/app/modules/core/widgets/stardard_text_field.dart';
import 'package:comparotto/app/modules/core/extensions/context_extension.dart';
import 'package:comparotto/app/modules/home/presentation/cubit/home_cubit.dart';
import 'package:comparotto/app/modules/home/presentation/widgets/employee_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsertPasswordWidget extends StatefulWidget {
  const InsertPasswordWidget({
    super.key,
  });

  @override
  State<InsertPasswordWidget> createState() => _InsertPasswordWidgetState();
}

class _InsertPasswordWidgetState extends State<InsertPasswordWidget> {
  late HomeCubit _homeCubit;
  @override
  void initState() {
    _homeCubit = BlocProvider.of<HomeCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        switch (state) {
          case AuthSuccess _:
            {
              Navigator.of(context).pop();
              AnimatedSnackBar(
                duration: const Duration(seconds: 2),
                builder: ((context) {
                  return MaterialAnimatedSnackBar(
                    messageText:
                        'Bem vindo! ${state.authResponse.funcionario?.nome?.firstName}',
                    type: AnimatedSnackBarType.success,
                    messageTextStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    titleTextStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  );
                }),
              ).show(context);
            }
          case AuthError _:
            {
              AnimatedSnackBar(
                duration: const Duration(seconds: 2),
                builder: ((context) {
                  return const MaterialAnimatedSnackBar(
                    messageText: 'Credenciais inválidas',
                    type: AnimatedSnackBarType.error,
                    messageTextStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    titleTextStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  );
                }),
              ).show(context);
            }
          default:
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StandardTextField(
                onChanged: (value) => _homeCubit.fetch(),
                padding: const EdgeInsets.only(bottom: 20),
                shouldValidate: false,
                compoundableFormatter: PasswordInputFormatter(),
                controller: _homeCubit.passwordEditingController),
            StandardButton(
                enabled: _homeCubit.getButtonStatus(),
                onPressed: () => _homeCubit.auth(),
                text: AppStrings.enter),
            StandardButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _homeCubit.clearFields();
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
                text: AppStrings.changeEmployee)
          ],
        );
      },
    );
  }
}
