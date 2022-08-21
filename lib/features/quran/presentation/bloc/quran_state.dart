part of 'quran_bloc.dart';

enum LoadStatus { empty, loading, loaded, error }

class QuranState extends Equatable {
  QuranState({
    List<QuranData>? listVerse,
    List<QuranData>? listVerseNew,
    this.loadStatus = LoadStatus.empty,
    this.errorMessage = "",
  })  : listVerse = listVerse ?? [],
        listVerseNew = listVerseNew ?? [];

  final List<QuranData> listVerse;
  final List<QuranData> listVerseNew;
  final LoadStatus loadStatus;
  final String errorMessage;

  QuranState copyWith({
    final List<QuranData>? listVerse,
    final List<QuranData>? listVerseNew,
    final LoadStatus? loadStatus,
    final String? errorMessage,
  }) {
    return QuranState(
      listVerse: listVerse ?? this.listVerse,
      listVerseNew: listVerseNew ?? this.listVerseNew,
      loadStatus: loadStatus ?? this.loadStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        listVerse,
        listVerseNew,
        loadStatus,
        errorMessage,
      ];
}
