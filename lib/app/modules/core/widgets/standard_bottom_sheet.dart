import 'package:comparotto/app/modules/core/widgets/standard_button.dart';
import 'package:flutter/material.dart';

class StandardBottomSheetParams {
  StandardBottomSheetParams(
      {required this.content,
      required this.title,
      required this.standardBottomSheetButtonContenParamsList});
  final String title;
  final String content;
  final List<StandardBottomSheetButtonParams>
      standardBottomSheetButtonContenParamsList;
}

class StandardBottomSheetButtonParams {
  final String title;
  final Function()? onPressed;
  final Color color;

  StandardBottomSheetButtonParams(
      {required this.title, required this.onPressed, required this.color});
}

class StandardBottomSheet extends StatelessWidget {
  const StandardBottomSheet({
    super.key,
    required this.standardbottomSheetParams,
  });
  final StandardBottomSheetParams standardbottomSheetParams;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: Colors.white,
      elevation: 20,
      onClosing: () {},
      builder: (context) => Container(
        height: 350,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 203, 203, 203),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Text(standardbottomSheetParams.title,
                style: const TextStyle(
                  height: 0,
                  fontSize: 25,
                  fontFamily: 'Bellfort',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(
              height: 20,
            ),
            Text(standardbottomSheetParams.content,
                style: const TextStyle(
                  height: 0,
                  fontSize: 18,
                  fontFamily: 'Bellfort',
                  color: Color.fromARGB(255, 203, 203, 203),
                  fontWeight: FontWeight.w600,
                )),
            for (int i = 0;
                i <
                    standardbottomSheetParams
                        .standardBottomSheetButtonContenParamsList.length;
                i++)
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: StandardButton(
                  text: standardbottomSheetParams
                      .standardBottomSheetButtonContenParamsList[i].title,
                  borderColor: const Color(0xFF5DB075),
                  color: standardbottomSheetParams
                      .standardBottomSheetButtonContenParamsList[i].color,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
