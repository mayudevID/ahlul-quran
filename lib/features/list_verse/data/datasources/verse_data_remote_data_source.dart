import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../models/verse_data_model.dart';

abstract class VerseDataRemoteDataSource {
  Future<List<VerseDataModel>> getVerseData(String number);
}

class VerseDataRemoteDataSourceImpl implements VerseDataRemoteDataSource {
  VerseDataRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<List<VerseDataModel>> getVerseData(String number) async {
    var response = await dio
        .get("https://al-quran-8d642.firebaseio.com/surat/$number.json");

    if (response.statusCode == 200) {
      List<VerseDataModel> listData = [];

      for (var element in response.data) {
        listData.add(VerseDataModel.fromJson(element));
      }

      return listData;
    } else {
      throw ServerException();
    }
  }
}
