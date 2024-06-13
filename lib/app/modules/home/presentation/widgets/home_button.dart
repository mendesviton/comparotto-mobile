import 'package:comparotto/app/modules/home/presentation/view/home_page.dart';
import 'package:comparotto/app/modules/core/widgets/standard_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    required this.buttonModel,
  });

  final HomeButtonModel buttonModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) => StandardBottomSheet(
          standardbottomSheetParams: StandardBottomSheetParams(
              content: 'aaaa',
              title: 'aaaaaa',
              standardBottomSheetButtonContenParamsList: []),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: buttonModel.color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              buttonModel.urlImage,
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(buttonModel.title,
                  style: const TextStyle(
                    height: 0,
                    fontSize: 18,
                    fontFamily: 'Bellfort',
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w600,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
