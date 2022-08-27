import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/verse_data.dart';
import '../repositories/verse_data_repository.dart';

class GetVerseData implements UseCase<List<VerseData>, Params> {
  final VerseDataRepository verseDataRepository;

  GetVerseData({required this.verseDataRepository});

  @override
  Future<Either<Failure, List<VerseData>>> call(Params params) async {
    return await verseDataRepository.getVerseData(params.number);
  }
}

class Params extends Equatable {
  final String number;

  const Params({required this.number});

  @override
  List<Object> get props => [number];
}
