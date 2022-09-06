part of 'list_verse_bloc.dart';

abstract class ListVerseEvent extends Equatable {
  const ListVerseEvent();

  @override
  List<Object> get props => [];
}

class OnGetVerseData extends ListVerseEvent {
  const OnGetVerseData(this.number);

  final String number;
}

class OnReversedListVerse extends ListVerseEvent {
  const OnReversedListVerse();
}

class OnMarkerSurah extends ListVerseEvent {
  const OnMarkerSurah(this.singleVerseData);

  final SingleVerseData singleVerseData;
}
