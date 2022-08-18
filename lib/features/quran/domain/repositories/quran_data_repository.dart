import 'package:alquran_mobile_apps/features/quran/domain/entities/quran_data.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class QuranDataRepository {
  Future<Either<Failure, List<QuranData>>> getQuranData();
}
