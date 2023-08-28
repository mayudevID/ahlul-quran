// ignore_for_file: constant_identifier_names
import 'package:alquran_mobile_apps/features/list_verse/domain/entities/single_verse_data.dart';
import 'package:alquran_mobile_apps/features/list_verse/domain/usecases/save_marker.dart';
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
  ListVerseBloc({
    required GetVerseData getVerseData,
    required SaveMarker saveMarker,
  })  : _getVerseData = getVerseData,
        _saveMarker = saveMarker,
        super(ListVerseState()) {
    on<OnGetVerseData>(_onGetVerseData);
    on<OnReversedListVerse>(_onReversedListVerse);
    on<OnMarkerSurah>(_onMarkerSurah);
  }

  final GetVerseData _getVerseData;
  final SaveMarker _saveMarker;

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

  void _onReversedListVerse(
    OnReversedListVerse event,
    Emitter<ListVerseState> emit,
  ) {
    if (state.loadVerseStatus == LoadVerseStatus.loaded) {
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
    emit(state.copyWith(loadVerseStatus: LoadVerseStatus.loading));
    final failureOrData = await _getVerseData(Params(number: event.number));
    failureOrData.fold(
      (error) {
        emit(
          state.copyWith(
            errorMessage: _mapFailureToMessage(error),
            loadVerseStatus: LoadVerseStatus.error,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            listVerse: data,
            loadVerseStatus: LoadVerseStatus.loaded,
          ),
        );
      },
    );
  }

  void _onMarkerSurah(OnMarkerSurah event, Emitter<ListVerseState> emit) async {
    await _saveMarker(ParamsData(singleVerseData: event.singleVerseData));
  }
}
