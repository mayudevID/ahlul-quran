part of 'quran_bloc.dart';

abstract class QuranEvent extends Equatable {
  const QuranEvent();

  @override
  List<Object> get props => [];
}

class OnGetData extends QuranEvent {
  const OnGetData();
}

class OnSearch extends QuranEvent {
  const OnSearch(this.valueSearch);

  final String valueSearch;
}

class OnStartRecite extends QuranEvent {
  const OnStartRecite(this.quranData);

  final QuranData quranData;
}

class OnPauseRecite extends QuranEvent {
  const OnPauseRecite();
}

class OnStopOrFinishRecite extends QuranEvent {
  const OnStopOrFinishRecite();
}

class OnResumeRecite extends QuranEvent {
  const OnResumeRecite();
}

class OnReversedList extends QuranEvent {
  const OnReversedList();
}

class OnPositionStream extends QuranEvent {
  const OnPositionStream();
}

class OnDurationStream extends QuranEvent {
  const OnDurationStream();
}

class OnPlayingStream extends QuranEvent {
  const OnPlayingStream();
}
