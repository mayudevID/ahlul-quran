part of 'list_verse_bloc.dart';

enum LoadStatus { empty, loading, loaded, error }

class ListVerseState extends Equatable {
  ListVerseState({
    List<VerseData>? listVerse,
    this.loadStatus = LoadStatus.empty,
    this.errorMessage = "",
    this.isListReversed = false,
  }) : listVerse = listVerse ?? [];

  final List<VerseData> listVerse;
  final LoadStatus loadStatus;
  final String errorMessage;
  final bool isListReversed;

  ListVerseState copyWith({
    final List<VerseData>? listVerse,
    final LoadStatus? loadStatus,
    final String? errorMessage,
    final bool? isListReversed,
  }) {
    return ListVerseState(
        listVerse: listVerse ?? this.listVerse,
        loadStatus: loadStatus ?? this.loadStatus,
        errorMessage: errorMessage ?? this.errorMessage,
        isListReversed: isListReversed ?? this.isListReversed);
  }

  @override
  List<Object> get props => [
        listVerse,
        loadStatus,
        errorMessage,
        isListReversed,
      ];
}
