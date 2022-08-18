import 'package:alquran_mobile_apps/features/quran/domain/entities/quran_data.dart';
import 'package:alquran_mobile_apps/core/error/failures.dart';
import 'package:alquran_mobile_apps/features/quran/domain/repositories/quran_data_repository.dart';
import 'package:dartz/dartz.dart';

class QuranDataRepositoryImpl extends QuranDataRepository {
  @override
  Future<Either<Failure, List<QuranData>>> getQuranData() {
    // TODO: implement getQuranData
    throw UnimplementedError();
  }
}
