import 'package:comparotto/app/modules/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class StandardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StandardAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      centerTitle: true,
      shadowColor: const Color.fromARGB(255, 250, 250, 250),
      surfaceTintColor: Colors.white,
      title: Text(
        title,
        style: context.theme.textTheme.mediumBlackTextStyle,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
