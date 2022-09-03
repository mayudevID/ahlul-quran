part of 'quran_bloc.dart';

enum LoadStatus { empty, loading, loaded, error }

class QuranState extends Equatable {
  QuranState({
    List<QuranData>? listSurah,
    List<QuranData>? listSurahNew,
    //AudioPlayer? audioPlayer,
    this.audioTargetNumber = "999",
    this.loadStatus = LoadStatus.empty,
    this.errorMessage = "",
    this.isPlaying = false,
    this.isPaused = false,
    this.isCompleted = false,
    this.isListReversed = false,
    this.duration = 0,
    this.position = 0,
  })  : listSurah = listSurah ?? [],
        listSurahNew = listSurahNew ?? [];
  //audioPlayer = audioPlayer ?? AudioPlayer();

  final List<QuranData> listSurah;
  final List<QuranData> listSurahNew;
  final LoadStatus loadStatus;
  final String errorMessage;
  final String audioTargetNumber;
  //final AudioPlayer audioPlayer;
  final int duration;
  final int position;
  final bool isPlaying;
  final bool isListReversed;
  final bool isPaused;
  final bool isCompleted;

  QuranState copyWith({
    final List<QuranData>? listSurah,
    final List<QuranData>? listSurahNew,
    final LoadStatus? loadStatus,
    final String? errorMessage,
    final String? audioTargetNumber,
    final AudioPlayer? audioPlayer,
    final int? duration,
    final int? position,
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
      //audioPlayer: audioPlayer ?? this.audioPlayer,
      audioTargetNumber: audioTargetNumber ?? this.audioTargetNumber,
      duration: duration ?? this.duration,
      position: position ?? this.position,
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
        //audioPlayer,
        audioTargetNumber,
        isPlaying,
        isListReversed,
        isPaused,
        isCompleted,
      ];
}
