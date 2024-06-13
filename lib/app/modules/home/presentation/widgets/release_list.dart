import 'package:comparotto/app/modules/home/data/model/home_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReleaseList extends StatelessWidget {
  const ReleaseList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < stockHomeList.length; i++)
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: stockHomeList[i].type == StockType.down
                    ? const Color(0xFFFFF2F2)
                    : const Color(0xFFF1FFDB)),
            margin: const EdgeInsets.only(right: 20, left: 20, bottom: 15),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            // height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                        backgroundColor: stockHomeList[i].type == StockType.down
                            ? const Color(0xFFFFDCD7)
                            : const Color(0xFFE1F8BC),
                        radius: 24,
                        child: SvgPicture.asset(
                            stockHomeList[i].type == StockType.down
                                ? 'assets/icons/down.svg'
                                : 'assets/icons/up.svg'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(stockHomeList[i].title,
                            style: const TextStyle(
                              height: 0,
                              fontSize: 18,
                              fontFamily: 'Bellfort',
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w600,
                            )),
                        Text(stockHomeList[i].date,
                            style: const TextStyle(
                              height: 0,
                              fontSize: 18,
                              fontFamily: 'Bellfort',
                              color: Color.fromARGB(255, 162, 162, 162),
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ],
                ),
                const Text('15 und',
                    style: TextStyle(
                      height: 0,
                      fontSize: 18,
                      fontFamily: 'Bellfort',
                      color: Color.fromARGB(255, 162, 162, 162),
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
      ],
    );
  }
}
