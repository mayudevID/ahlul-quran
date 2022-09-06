import 'package:alquran_mobile_apps/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/single_verse_data.dart';

abstract class VerseDataLocalDataSource {
  Future<void> saveMarker(SingleVerseData singleVerseData);
}

class VerseDataLocalDataSourceImpl implements VerseDataLocalDataSource {
  VerseDataLocalDataSourceImpl({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Future<void> saveMarker(SingleVerseData singleVerseData) async {
    try {
      sharedPreferences.setStringList(
        "__single_verse_list__",
        [
          singleVerseData.surahId.toString(),
          singleVerseData.verseId.toString(),
          singleVerseData.nama,
        ],
      );
    } catch (e) {
      throw CacheException();
    }
  }
}
