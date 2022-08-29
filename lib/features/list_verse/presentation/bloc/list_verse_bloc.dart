// ignore_for_file: constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/verse_data.dart';
import '../../domain/usecases/get_verse_data.dart';

part 'list_verse_event.dart';
part 'list_verse_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class ListVerseBloc extends Bloc<ListVerseEvent, ListVerseState> {
  ListVerseBloc({required GetVerseData getVerseData})
      : _getVerseData = getVerseData,
        super(ListVerseState()) {
    on<OnGetVerseData>(_onGetVerseData);
    on<OnReversedList>(_onReversedList);
  }

  final GetVerseData _getVerseData;

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

  void _onReversedList(
    OnReversedList event,
    Emitter<ListVerseState> emit,
  ) {
    if (state.loadStatus == LoadStatus.loaded) {
      emit(state.copyWith(
        listVerse: state.listVerse.reversed.toList(),
        isListReversed: !state.isListReversed,
      ));
    }
  }

  void _onGetVerseData(
    OnGetVerseData event,
    Emitter<ListVerseState> emit,
  ) async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    final failureOrData = await _getVerseData(Params(number: event.number));
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
