part of 'list_verse_bloc.dart';

enum LoadVerseStatus { empty, loading, loaded, error }

class ListVerseState extends Equatable {
  ListVerseState({
    List<VerseData>? listVerse,
    this.loadVerseStatus = LoadVerseStatus.empty,
    this.errorMessage = "",
    this.isListReversed = false,
  }) : listVerse = listVerse ?? [];

  final List<VerseData> listVerse;
  final LoadVerseStatus loadVerseStatus;
  final String errorMessage;
  final bool isListReversed;

  ListVerseState copyWith({
    final List<VerseData>? listVerse,
    final LoadVerseStatus? loadVerseStatus,
    final String? errorMessage,
    final bool? isListReversed,
  }) {
    return ListVerseState(
        listVerse: listVerse ?? this.listVerse,
        loadVerseStatus: loadVerseStatus ?? this.loadVerseStatus,
        errorMessage: errorMessage ?? this.errorMessage,
        isListReversed: isListReversed ?? this.isListReversed);
  }

  @override
  List<Object> get props => [
        listVerse,
        loadVerseStatus,
        errorMessage,
        isListReversed,
      ];
}
