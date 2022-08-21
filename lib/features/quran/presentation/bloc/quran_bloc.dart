// ignore_for_file: constant_identifier_names

import 'package:alquran_mobile_apps/core/usecases/usecase.dart';
import 'package:alquran_mobile_apps/features/quran/domain/entities/quran_data.dart';
import 'package:alquran_mobile_apps/features/quran/domain/usecases/get_quran_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';

part 'quran_event.dart';
part 'quran_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  QuranBloc({required GetQuranData getQuranData})
      : _getQuranData = getQuranData,
        super(QuranState()) {
    on<OnGetData>(_onGetData);
  }

  final GetQuranData _getQuranData;

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }

  void _onGetData(
    OnGetData event,
    Emitter<QuranState> emit,
  ) async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    final failureOrData = await _getQuranData(NoParams());
    failureOrData.fold(
      (error) {
        emit(
          state.copyWith(
            errorMessage: _mapFailureToMessage(error),
            loadStatus: LoadStatus.error,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            listVerse: data,
            loadStatus: LoadStatus.loaded,
          ),
        );
      },
    );
  }
}
