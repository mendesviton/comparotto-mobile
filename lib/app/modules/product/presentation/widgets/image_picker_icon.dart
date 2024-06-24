import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImagePickerIcon extends StatelessWidget {
  const ImagePickerIcon({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onPressed,
  });
  final String title;
  final String iconPath;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SvgPicture.asset(
              iconPath,
            ),
          ),
          Text(title)
        ],
      ),
    );
  }
}
