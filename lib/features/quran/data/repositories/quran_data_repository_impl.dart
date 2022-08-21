import 'package:alquran_mobile_apps/core/error/exceptions.dart';
import 'package:alquran_mobile_apps/features/quran/data/datasources/quran_data_remote_data_source.dart';
import 'package:alquran_mobile_apps/features/quran/domain/entities/quran_data.dart';
import 'package:alquran_mobile_apps/core/error/failures.dart';
import 'package:alquran_mobile_apps/features/quran/domain/repositories/quran_data_repository.dart';
import 'package:dartz/dartz.dart';

class QuranDataRepositoryImpl implements QuranDataRepository {
  final QuranDataRemoteDataSource quranDataRemoteDataSource;

  QuranDataRepositoryImpl({
    required this.quranDataRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<QuranData>>> getQuranData() async {
    try {
      final data = await quranDataRemoteDataSource.getQuranData();
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
