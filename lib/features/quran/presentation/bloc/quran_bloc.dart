import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quran_event.dart';
part 'quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  QuranBloc() : super(QuranState()) {
    on<OnGetData>(_onGetData);
  }

  void _onGetData(
    OnGetData event,
    Emitter<QuranState> emit,
  ) {}
}
