import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_verse_event.dart';
part 'list_verse_state.dart';

class ListVerseBloc extends Bloc<ListVerseEvent, ListVerseState> {
  ListVerseBloc() : super(ListVerseInitial()) {
    on<ListVerseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
