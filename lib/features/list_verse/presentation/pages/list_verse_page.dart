import 'package:alquran_mobile_apps/features/quran/domain/entities/quran_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/utils/function.dart';
import '../../../quran/data/models/quran_data_model.dart';
import '../widgets/list_verse.dart';

class ListVersePage extends StatelessWidget {
  const ListVersePage({Key? key, required this.quranData}) : super(key: key);

  final QuranData quranData;

  @override
  Widget build(BuildContext context) {
    return ListVersePageContent(
      quranData: quranData,
    );
  }
}

class ListVersePageContent extends StatelessWidget {
  const ListVersePageContent({Key? key, required this.quranData})
      : super(key: key);

  final QuranData quranData;

  Size _textSize(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontFamily: "Poppins",
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  double _resizeMeanText(BuildContext context) {
    if (_textSize(quranData.arti).width > MyFunction.getWidth(context, 120)) {
      return 11;
    } else {
      return 14;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF5),
      body: Column(
        children: [
          SizedBox(
            height: MyFunction.getHeight(context, 48),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MyFunction.getWidth(context, 24),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/vector/back.png",
                    width: MyFunction.getWidth(context, 24.62),
                    height: MyFunction.getHeight(context, 24),
                  ),
                ),
                SizedBox(
                  width: MyFunction.getWidth(context, 18),
                ),
                const Text(
                  "Juz 1",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFDA8856),
                  ),
                ),
                const Spacer(),
                Image.asset(
                  "assets/vector/ascdesc.png",
                  width: MyFunction.getWidth(context, 24),
                  height: MyFunction.getHeight(context, 24),
                ),
                SizedBox(
                  width: MyFunction.getWidth(context, 18),
                ),
                Image.asset(
                  "assets/vector/unduh.png",
                  width: MyFunction.getWidth(context, 24),
                  height: MyFunction.getHeight(context, 24),
                ),
                SizedBox(
                  width: MyFunction.getWidth(context, 18),
                ),
                Image.asset(
                  "assets/vector/list.png",
                  width: MyFunction.getWidth(context, 24.63),
                  height: MyFunction.getHeight(context, 24),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MyFunction.getHeight(context, 8),
          ),
          Center(
            child: Text(
              "${quranData.nomor}. ${quranData.nama}",
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFFDA8856),
              ),
            ),
          ),
          SizedBox(
            height: MyFunction.getHeight(context, 8),
          ),
          Container(
            height: MyFunction.getHeight(context, 69),
            decoration: const BoxDecoration(
              color: Color(0xFFDA8856),
            ),
            child: Row(
              children: [
                Transform.translate(
                  offset: Offset(MyFunction.getWidth(context, -26.5), 0),
                  child: Image.asset(
                    "assets/vector/ornament-surah.png",
                    width: MyFunction.getWidth(context, 53),
                    height: MyFunction.getHeight(context, 53),
                  ),
                ),
                // SizedBox(
                //   width: MyFunction.getWidth(context, 18),
                // ),
                Text(
                  (quranData.type == VerseType.MADINAH) ? "Madinah" : "Mekkah",
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/vector/tittle.png",
                        width: MyFunction.getWidth(context, 173.25),
                        height: MyFunction.getHeight(context, 45),
                      ),
                      Text(
                        quranData.arti,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: _resizeMeanText(context),
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   width: MyFunction.getWidth(context, 11.92),
                // ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      quranData.ayat.toString(),
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: MyFunction.getHeight(context, 3),
                    ),
                    const Text(
                      "Ayat",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Transform.translate(
                  offset: Offset(MyFunction.getWidth(context, 26.5), 0),
                  child: Image.asset(
                    "assets/vector/ornament-surah.png",
                    width: MyFunction.getWidth(context, 53),
                    height: MyFunction.getHeight(context, 53),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListVerse(),
                  ListVerse(),
                  ListVerse(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
