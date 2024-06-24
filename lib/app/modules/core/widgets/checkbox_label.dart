import 'package:comparotto/app/modules/core/extensions/app_theme.dart';
import 'package:comparotto/app/modules/core/extensions/context_extension.dart';
import 'package:comparotto/app/modules/core/res/app_image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckboxLabelClickable extends StatefulWidget {
  final bool value;
  final String label;
  final ValueChanged<bool> onChanged;
  final EdgeInsetsGeometry padding;

  const CheckboxLabelClickable({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
    this.padding = EdgeInsets.zero,
  });

  @override
  State<CheckboxLabelClickable> createState() => _CheckboxLabelClickableState();
}

class _CheckboxLabelClickableState extends State<CheckboxLabelClickable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late bool value = widget.value;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onChanged(!value);
        });
      },
      child: Row(
        children: <Widget>[
          Container(
            width: 28,
            height: 28,
            margin: widget.padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              border: Border.all(
                color: const Color(0xFFD2D8D7),
                width: 1,
              ),
              color: value ? Colors.teal : Colors.transparent,
            ),
            child: value
                ? const Icon(
                    Icons.close,
                    color: Colors.white,
                  )
                : const SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(widget.label,
                style: context.theme.textTheme.smallGreyTextStyle),
          )
        ],
      ),
    );
  }
}
