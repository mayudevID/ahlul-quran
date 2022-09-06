import 'package:equatable/equatable.dart';

class SingleVerseData extends Equatable {
  final String verseId;
  final String surahId;
  final String nama;

  const SingleVerseData({
    required this.verseId,
    required this.surahId,
    required this.nama,
  });

  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [verseId, nama, surahId];
}
