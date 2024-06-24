import 'dart:ui';

import 'package:comparotto/app/modules/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class StandardDialogParams {
  final String title;
  final Widget content;
  StandardDialogParams({required this.title, this.content = const SizedBox()});
}

class StandardDialog extends StatelessWidget {
  final StandardDialogParams standardDialogsParams;
  const StandardDialog({
    super.key,
    required this.standardDialogsParams,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              width: context.width * 0.8,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 30,
                      color: Colors.black.withOpacity(0.4))
                ],
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 246, 246, 246),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        standardDialogsParams.title,
                        style: context
                            .theme.textTheme.mediumGreenDmSansRegularTextStyle,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [standardDialogsParams.content],
                      )
                    ],
                  )
                  // ),
                  // ],
                  // ),
                  ),
            )),
      ),
    );
  }
}
