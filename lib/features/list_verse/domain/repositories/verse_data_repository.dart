import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/single_verse_data.dart';
import '../entities/verse_data.dart';

abstract class VerseDataRepository {
  Future<Either<Failure, List<VerseData>>> getVerseData(String number);
  Future<Either<Failure, void>> saveMarker(SingleVerseData singleVerseData);
}
