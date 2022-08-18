part of 'quran_bloc.dart';

class QuranState extends Equatable {
  QuranState({
    List? listVerse,
  }) : listVerse = listVerse ?? [];

  final List listVerse;

  QuranState copyWith({
    final List? listVerse,
  }) {
    return QuranState(
      listVerse: listVerse ?? this.listVerse,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
