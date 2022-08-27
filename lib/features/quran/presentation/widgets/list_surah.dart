import 'package:alquran_mobile_apps/features/list_verse/presentation/pages/list_verse_page.dart';
import 'package:alquran_mobile_apps/features/quran/data/models/quran_data_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/function.dart';
import '../../domain/entities/quran_data.dart';

class ListSurah extends StatelessWidget {
  const ListSurah({
    Key? key,
    required this.quranData,
  }) : super(key: key);

  final QuranData quranData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return ListVersePage(quranData: quranData);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MyFunction.getWidth(context, 24),
        ),
        padding: EdgeInsets.symmetric(
          vertical: MyFunction.getWidth(context, 9),
        ),
        child: Row(
          children: [
            SizedBox(
              width: MyFunction.getWidth(context, 37),
              height: MyFunction.getHeight(context, 37),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/vector/number.png",
                    width: MyFunction.getWidth(context, 37),
                    height: MyFunction.getHeight(context, 37),
                  ),
                  Center(
                    child: Text(
                      quranData.nomor,
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
              width: MyFunction.getWidth(context, 18),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quranData.nama,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFDA8856),
                    ),
                  ),
                  SizedBox(
                    height: MyFunction.getHeight(context, 6),
                  ),
                  Row(
                    children: [
                      Text(
                        (quranData.type == VerseType.MADINAH)
                            ? "MADINAH"
                            : "MEKKAH",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF292C29).withOpacity(0.6),
                        ),
                      ),
                      SizedBox(
                        width: MyFunction.getWidth(context, 5),
                      ),
                      Container(
                        width: MyFunction.getWidth(context, 4),
                        height: MyFunction.getHeight(context, 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFBBC4CE).withOpacity(0.35),
                        ),
                      ),
                      SizedBox(
                        width: MyFunction.getWidth(context, 5),
                      ),
                      Text(
                        "${quranData.ayat} AYAT",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF292C29).withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                quranData.asma,
                style: const TextStyle(
                  fontFamily: "Amiri",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFDA8856),
                ),
              ),
            ),
            SizedBox(
              width: MyFunction.getWidth(context, 18),
            ),
            Image.asset(
              "assets/vector/sound.png",
              width: MyFunction.getWidth(context, 24),
              height: MyFunction.getHeight(context, 24),
            ),
          ],
        ),
      ),
    );
  }
}
