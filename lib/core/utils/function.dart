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

  static String getDataQuranName(int indexJuz) {
    final data = DataMap.listJuz.entries
        .where((element) => element.key == indexJuz)
        .first
        .value;
    final data1k = data[0].keys.first;
    final data1v = data[0].values.first;
    final data2k = data[1].keys.first;
    final data2v = data[1].values.first;
    return "QS. [$data1k:$data1v] - QS. [$data2k:$data2v]";
  }

  static String getJuz(int target) {
    final List<int> whereJuz = [];
    DataMap.listJuz.forEach((key, value) {
      final d1 = value[0].keys.first;
      final d2 = value[1].keys.first;

      if (d1 <= target && target <= d2) {
        whereJuz.add(key);
      }
    });
    if (whereJuz.length > 1) {
      return "Juz ${whereJuz.first} - ${whereJuz.last}";
    } else {
      return "Juz ${whereJuz.first}";
    }
  }
}
