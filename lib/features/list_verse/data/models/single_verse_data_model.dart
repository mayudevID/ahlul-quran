import '../../domain/entities/single_verse_data.dart';

class SingleVerseDataModel extends SingleVerseData {
  const SingleVerseDataModel({
    required String verseId,
    required String surahId,
    required String nama,
  }) : super(verseId: verseId, surahId: surahId, nama: nama);

  factory SingleVerseDataModel.fromJson(Map<String, dynamic> json) =>
      SingleVerseDataModel(
        verseId: json["verseId"],
        surahId: json["surahId"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "verseId": verseId,
        "surahId": surahId,
        "nama": nama,
      };
}
