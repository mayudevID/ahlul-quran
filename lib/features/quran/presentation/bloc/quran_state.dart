part of 'quran_bloc.dart';

enum LoadStatus { empty, loading, loaded, error }

class QuranState extends Equatable {
  QuranState({
    List<QuranData>? listSurah,
    List<QuranData>? listSurahNew,
    this.audioTargetNumber = 999,
    this.loadStatus = LoadStatus.empty,
    this.errorMessage = "",
    this.isPlaying = false,
    this.isPaused = false,
    this.isCompleted = false,
    this.isListReversed = false,
    this.duration = 0,
    this.position = 0,
    this.bufferedPosition = 0,
    this.dragValue = -1,
    this.processingState = ProcessingState.idle,
  })  : listSurah = listSurah ?? [],
        listSurahNew = listSurahNew ?? [];

  final List<QuranData> listSurah;
  final List<QuranData> listSurahNew;
  final LoadStatus loadStatus;
  final String errorMessage;
  final int audioTargetNumber;
  final ProcessingState processingState;
  final int duration;
  final int position;
  final int bufferedPosition;
  final double dragValue;
  final bool isPlaying;
  final bool isListReversed;
  final bool isPaused;
  final bool isCompleted;

  QuranState copyWith({
    final List<QuranData>? listSurah,
    final List<QuranData>? listSurahNew,
    final LoadStatus? loadStatus,
    final String? errorMessage,
    final int? audioTargetNumber,
    final ProcessingState? processingState,
    final int? duration,
    final int? position,
    final int? bufferedPosition,
    final double? dragValue,
    final bool? isPlaying,
    final bool? isListReversed,
    final bool? isPaused,
    final bool? isCompleted,
  }) {
    return QuranState(
      listSurah: listSurah ?? this.listSurah,
      listSurahNew: listSurahNew ?? this.listSurahNew,
      loadStatus: loadStatus ?? this.loadStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      audioTargetNumber: audioTargetNumber ?? this.audioTargetNumber,
      duration: duration ?? this.duration,
      position: position ?? this.position,
      bufferedPosition: bufferedPosition ?? this.bufferedPosition,
      dragValue: dragValue ?? this.dragValue,
      processingState: processingState ?? this.processingState,
      isPlaying: isPlaying ?? this.isPlaying,
      isListReversed: isListReversed ?? this.isListReversed,
      isPaused: isPaused ?? this.isPaused,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [
        listSurah,
        listSurahNew,
        loadStatus,
        errorMessage,
        processingState,
        audioTargetNumber,
        duration,
        position,
        dragValue,
        bufferedPosition,
        isPlaying,
        isListReversed,
        isPaused,
        isCompleted,
      ];
}
