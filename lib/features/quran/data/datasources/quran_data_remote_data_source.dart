import '../models/quran_data_model.dart';

abstract class QuranDataRemoteDataSource {
  Future<List<QuranDataModel>> getQuranData();
}

class QuranDataRemoteDataSourceImpl implements QuranDataRemoteDataSource {
  @override
  Future<List<QuranDataModel>> getQuranData() {
    // TODO: implement getQuranData
    throw UnimplementedError();
  }
}
