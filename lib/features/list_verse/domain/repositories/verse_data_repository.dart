import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/verse_data.dart';

abstract class VerseDataRepository {
  Future<Either<Failure, List<VerseData>>> getVerseData(String number);
}
