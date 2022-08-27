import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/quran_data.dart';
import '../repositories/quran_data_repository.dart';

class GetQuranData implements UseCase<List<QuranData>, NoParams> {
  final QuranDataRepository quranDataRepository;

  GetQuranData({required this.quranDataRepository});

  @override
  Future<Either<Failure, List<QuranData>>> call(NoParams params) async {
    return await quranDataRepository.getQuranData();
  }
}
