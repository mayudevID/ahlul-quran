import 'package:flutter/material.dart';

import '../../../../core/utils/function.dart';

class ListJuz extends StatelessWidget {
  const ListJuz({super.key, required this.indexJuz});

  final int indexJuz;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) {
        //       return ListVersePage(
        //         quranData: quranData,
        //         quranBloc: context.read<QuranBloc>(),
        //       );
        //     },
        //   ),
        // );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Func.getWidth(context, 24),
        ),
        padding: EdgeInsets.only(
          top: Func.getWidth(context, 9),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: Func.getWidth(context, 37),
                  height: Func.getHeight(context, 37),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/vector/number.png",
                        width: Func.getWidth(context, 37),
                        height: Func.getHeight(context, 37),
                      ),
                      Center(
                        child: Text(
                          indexJuz.toString(),
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFDA8856),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: Func.getWidth(context, 18),
                ),
                Expanded(
                  child: Text(
                    "Juz $indexJuz",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFDA8856),
                    ),
                  ),
                ),
                Text(
                  Func.getDataQuranName(indexJuz),
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF292C29).withOpacity(0.6),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Func.getHeight(context, 7),
            ),
            Divider(
              height: 2,
              color: const Color(0xFFBBC4CE).withOpacity(0.35),
            ),
          ],
        ),
      ),
    );
  }
}
