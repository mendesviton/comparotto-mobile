import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ButtonSize { large, small }

class StandardButton extends StatelessWidget {
  const StandardButton({
    super.key,
    required this.text,
    this.color,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.size = ButtonSize.small,
    this.enabled = true,
    this.loading = false,
    this.icon,
    this.image,
    this.fontSize = 14,
    this.ignorePadding = false,
    this.iconPath,
    this.horizontalInsidePadding = 0,
  });

  final bool loading;
  final bool? enabled;
  final Color? textColor;
  final String text;
  final Color? borderColor;
  final Color? color;
  final Function()? onPressed;
  final ButtonSize? size;
  final Icon? icon;
  final Image? image;
  final double fontSize;
  final bool ignorePadding;
  final String? iconPath;
  final double horizontalInsidePadding;

  static double getBottomInsets(BuildContext context, {num? bottomPadding}) {
    if (Platform.isAndroid) {
      return MediaQuery.of(context).viewInsets.bottom +
          (bottomPadding ?? 20) +
          MediaQuery.of(context).viewPadding.bottom;
    } else {
      return MediaQuery.of(context).viewInsets.bottom + (bottomPadding ?? 20);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ignorePadding
          ? EdgeInsets.zero
          : const EdgeInsets.only(
              bottom: 12,
            ),
      child: Center(
        child: SizedBox(
          height: 54,
          child: TextButton(
              style: TextButton.styleFrom(
                shadowColor: Colors.transparent,
                foregroundColor: Colors.white,
                backgroundColor: enabled! ? color ?? Colors.teal : Colors.grey,
                side: BorderSide(
                  color: enabled! ? borderColor ?? Colors.teal : Colors.grey,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: enabled!
                  ? () {
                      if (onPressed != null) {
                        onPressed!();
                      }
                    }
                  : null,
              child: !loading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MediaQuery.of(context).size.height > 700
                            ? icon != null
                                ? Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 16,
                                    height: 16,
                                    child: icon,
                                  )
                                : iconPath != null
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: SvgPicture.asset(
                                          iconPath ?? '',
                                          width: 20,
                                          height: 20,
                                          colorFilter: ColorFilter.mode(
                                              enabled!
                                                  ? textColor ?? Colors.pink
                                                  : Colors.red,
                                              BlendMode.srcIn),
                                        ),
                                      )
                                    : const SizedBox()
                            : const SizedBox(),
                        MediaQuery.of(context).size.height > 700
                            ? image != null
                                ? Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 16,
                                    height: 16,
                                    child: image,
                                  )
                                : const SizedBox()
                            : const SizedBox(),
                        Text(
                          text,
                          style: TextStyle(
                            height: 0,
                            fontSize: 18,
                            fontFamily: 'Bellfort',
                            // color: const Color.fromARGB(255, 203, 203, 203),
                            fontWeight: FontWeight.w600,
                            color: enabled!
                                ? textColor ??
                                    const Color.fromARGB(255, 253, 253, 253)
                                : const Color.fromARGB(255, 255, 255, 255),
                            // fontSize: fontSize,
                            // fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  : const Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                          valueColor: AlwaysStoppedAnimation(
                            Colors.grey,
                          ),
                        ),
                      ),
                    )),
        ),
      ),
    );
  }
}
