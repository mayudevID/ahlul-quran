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

class OnBufferedPositionStream extends QuranEvent {
  const OnBufferedPositionStream();
}

class OnDurationStream extends QuranEvent {
  const OnDurationStream();
}

class OnPlayingStream extends QuranEvent {
  const OnPlayingStream();
}

class OnProcessingStream extends QuranEvent {
  const OnProcessingStream();
}

class OnSeekEndChanged extends QuranEvent {
  const OnSeekEndChanged(this.val);

  final double val;
}

class OnDragValueSlider extends QuranEvent {
  const OnDragValueSlider(this.val);

  final double val;
}

class OnIndexStream extends QuranEvent {
  const OnIndexStream();
}
