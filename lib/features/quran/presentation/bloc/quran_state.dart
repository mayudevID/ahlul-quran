part of 'quran_bloc.dart';

enum LoadStatus { empty, loading, loaded, error }

class QuranState extends Equatable {
  QuranState({
    List<QuranData>? listSurah,
    List<QuranData>? listSurahNew,
    this.loadStatus = LoadStatus.empty,
    this.errorMessage = "",
    this.isPlaying = false,
    AudioPlayer? audioPlayer,
  })  : listSurah = listSurah ?? [],
        listSurahNew = listSurahNew ?? [],
        audioPlayer = audioPlayer ?? AudioPlayer();

  final List<QuranData> listSurah;
  final List<QuranData> listSurahNew;
  final LoadStatus loadStatus;
  final String errorMessage;
  final AudioPlayer audioPlayer;
  final bool isPlaying;

  QuranState copyWith({
    final List<QuranData>? listSurah,
    final List<QuranData>? listSurahNew,
    final LoadStatus? loadStatus,
    final String? errorMessage,
    final AudioPlayer? audioPlayer,
    final bool? isPlaying,
  }) {
    return QuranState(
      listSurah: listSurah ?? this.listSurah,
      listSurahNew: listSurahNew ?? this.listSurahNew,
      loadStatus: loadStatus ?? this.loadStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      audioPlayer: audioPlayer ?? this.audioPlayer,
      isPlaying: isPlaying ?? this.isPlaying,
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
        audioPlayer,
        isPlaying,
      ];
}
