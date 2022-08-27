import 'package:alquran_mobile_apps/features/list_verse/domain/entities/verse_data.dart';

class VerseDataModel extends VerseData {
  const VerseDataModel({
    required String ar,
    required String id,
    required String nomor,
    required String tr,
  }) : super(ar: ar, nomor: nomor, id: id, tr: tr);

  factory VerseDataModel.fromJson(Map<String, dynamic> json) => VerseDataModel(
        ar: json["ar"],
        id: json["id"],
        nomor: json["nomor"],
        tr: json["tr"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "id": id,
        "nomor": nomor,
        "tr": tr,
      };
}
