// ignore_for_file: prefer_conditional_assignment, unnecessary_new, constant_identifier_names, unnecessary_null_comparison

import 'package:alquran_mobile_apps/features/quran/domain/entities/quran_data.dart';

class QuranDataModel extends QuranData {
  const QuranDataModel({
    required super.arti,
    required super.asma,
    required super.audio,
    required super.ayat,
    required super.keterangan,
    required super.nama,
    required super.nomor,
    required super.rukuk,
    required super.type,
    required super.urut,
  });

  factory QuranDataModel.fromJson(Map<String, dynamic> json) => QuranDataModel(
        arti: json["arti"],
        asma: json["asma"],
        audio: json["audio"],
        ayat: json["ayat"],
        keterangan: json["keterangan"],
        nama: json["nama"],
        nomor: json["nomor"],
        rukuk: json["rukuk"],
        type: typeValues.map[json["type"]] ?? VerseType.MEKAH,
        urut: json["urut"],
      );

  Map<String, dynamic> toJson() => {
        "arti": arti,
        "asma": asma,
        "audio": audio,
        "ayat": ayat,
        "keterangan": keterangan,
        "nama": nama,
        "nomor": nomor,
        "rukuk": rukuk,
        "type": typeValues.reverse[type],
        "urut": urut,
      };
}

enum VerseType { MEKAH, MADINAH }

final typeValues =
    EnumValues({"madinah": VerseType.MADINAH, "mekah": VerseType.MEKAH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
