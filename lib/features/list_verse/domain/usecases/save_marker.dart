import 'package:alquran_mobile_apps/features/quran/domain/entities/quran_data.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/single_verse_data.dart';
import '../repositories/verse_data_repository.dart';

class SaveMarker implements UseCase<void, ParamsData> {
  final VerseDataRepository verseDataRepository;

  SaveMarker({required this.verseDataRepository});

  @override
  Future<Either<Failure, void>> call(ParamsData params) async {
    return await verseDataRepository.saveMarker(params.singleVerseData);
  }
}

class ParamsData extends Equatable {
  final SingleVerseData singleVerseData;

  const ParamsData({required this.singleVerseData});

  @override
  List<Object> get props => [singleVerseData];
}
