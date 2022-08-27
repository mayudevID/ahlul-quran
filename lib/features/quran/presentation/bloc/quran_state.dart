part of 'quran_bloc.dart';

enum LoadStatus { empty, loading, loaded, error }

class QuranState extends Equatable {
  QuranState({
    List<QuranData>? listSurah,
    List<QuranData>? listSurahNew,
    this.loadStatus = LoadStatus.empty,
    this.errorMessage = "",
  })  : listSurah = listSurah ?? [],
        listSurahNew = listSurahNew ?? [];

  final List<QuranData> listSurah;
  final List<QuranData> listSurahNew;
  final LoadStatus loadStatus;
  final String errorMessage;

  QuranState copyWith({
    final List<QuranData>? listSurah,
    final List<QuranData>? listSurahNew,
    final LoadStatus? loadStatus,
    final String? errorMessage,
  }) {
    return QuranState(
      listSurah: listSurah ?? this.listSurah,
      listSurahNew: listSurahNew ?? this.listSurahNew,
      loadStatus: loadStatus ?? this.loadStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        listSurah,
        listSurahNew,
        loadStatus,
        errorMessage,
      ];
}
