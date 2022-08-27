import 'package:equatable/equatable.dart';

class VerseData extends Equatable {
  final String ar;
  final String id;
  final String nomor;
  final String tr;

  const VerseData({
    required this.ar,
    required this.id,
    required this.nomor,
    required this.tr,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [ar, id, nomor, tr];
}
