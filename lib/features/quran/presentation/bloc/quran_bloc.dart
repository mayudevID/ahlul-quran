// ignore_for_file: constant_identifier_names

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/quran_data.dart';
import '../../domain/usecases/get_quran_data.dart';

part 'quran_event.dart';
part 'quran_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  QuranBloc({required GetQuranData getQuranData})
      : _getQuranData = getQuranData,
        super(QuranState()) {
    on<OnGetData>(_onGetData);
    on<OnSearch>(_onSearch);
    on<OnStartRecite>(_onStartRecite);
    on<OnReversedList>(_onReversedList);
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

  void _onReversedList(
    OnReversedList event,
    Emitter<QuranState> emit,
  ) {
    if (state.loadStatus == LoadStatus.loaded) {
      emit(state.copyWith(
        listSurah: state.listSurah.reversed.toList(),
        listSurahNew: state.listSurahNew.reversed.toList(),
        isListReversed: !state.isListReversed,
      ));
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
            listSurah: data,
            listSurahNew: data,
            loadStatus: LoadStatus.loaded,
          ),
        );
      },
    );
  }

  void _onSearch(
    OnSearch event,
    Emitter<QuranState> emit,
  ) {
    if (event.valueSearch == "") {
      emit(state.copyWith(listSurahNew: state.listSurah));
    } else {
      List<QuranData> newData = state.listSurah
          .where((e) =>
              e.nama.toLowerCase().contains(event.valueSearch) ||
              e.nomor.toLowerCase().contains(event.valueSearch) ||
              e.nama.toLowerCase().startsWith(event.valueSearch) ||
              e.nomor.toLowerCase().startsWith(event.valueSearch))
          .toList();

      emit(state.copyWith(listSurahNew: newData));
    }
  }

  void _onStartRecite(
    OnStartRecite event,
    Emitter<QuranState> emit,
  ) async {
    final uri = Uri.parse(event.urlQuran).replace(scheme: "https");

    await state.audioPlayer.stop();
    await state.audioPlayer.play(UrlSource(uri.toString()));
    emit(state.copyWith(
      isPlaying: true,
      isPaused: false,
      audioTargetNumber: event.numberQuran,
    ));

    state.audioPlayer.onDurationChanged.listen((event) {});

    state.audioPlayer.onPositionChanged.listen((event) {});

    state.audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.completed) {}
    });
  }

  @override
  Future<void> close() {
    // ignore: todo
    // TODO: implement close
    state.audioPlayer.dispose();
    return super.close();
  }
}
