part of 'list_verse_bloc.dart';

enum LoadStatus { empty, loading, loaded, error }

class ListVerseState extends Equatable {
  ListVerseState({
    List<VerseData>? listVerse,
    this.loadStatus = LoadStatus.empty,
    this.errorMessage = "",
  }) : listVerse = listVerse ?? [];

  final List<VerseData> listVerse;
  final LoadStatus loadStatus;
  final String errorMessage;

  ListVerseState copyWith({
    final List<VerseData>? listVerse,
    final LoadStatus? loadStatus,
    final String? errorMessage,
  }) {
    return ListVerseState(
      listVerse: listVerse ?? this.listVerse,
      loadStatus: loadStatus ?? this.loadStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [listVerse, loadStatus, errorMessage];
}
