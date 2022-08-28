import 'package:flutter/material.dart';

import '../../features/quran/domain/entities/quran_data.dart';
import 'data_map.dart';

class Func {
  static double getHeight(BuildContext context, double getSize) {
    return MediaQuery.of(context).size.height * getSize / 812;
  }

  static double getWidth(BuildContext context, double getSize) {
    return MediaQuery.of(context).size.width * getSize / 374;
  }

  static Size textSize(String text) {
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

  static double resizeMeanText(BuildContext context, QuranData quranData) {
    if (textSize(quranData.arti).width > Func.getWidth(context, 120)) {
      return 11;
    } else {
      return 14;
    }
  }

  static String detectPartOfQuran(QuranData quranData) {
    final number = int.tryParse(quranData.nomor) ?? 1;
    if (number >= 52 && number <= 57) {
      return "27";
    } else if (number >= 58 && number <= 66) {
      return "28";
    } else if (number >= 67 && number <= 77) {
      return "29";
    } else if (number >= 78 && number <= 144) {
      return "30";
    } else {
      final locate = DataMap.surahLocate.entries.firstWhere(
        (element) => element.key == quranData.nomor,
      );

      return locate.value;
    }
  }
}
