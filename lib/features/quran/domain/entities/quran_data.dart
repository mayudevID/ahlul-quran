import 'package:equatable/equatable.dart';

import '../../data/models/quran_data_model.dart';

class QuranData extends Equatable {
  final String arti;
  final String asma;
  final String audio;
  final int ayat;
  final String keterangan;
  final String nama;
  final String nomor;
  final String rukuk;
  final VerseType type;
  final String urut;

  const QuranData({
    required this.arti,
    required this.asma,
    required this.audio,
    required this.ayat,
    required this.keterangan,
    required this.nama,
    required this.nomor,
    required this.rukuk,
    required this.type,
    required this.urut,
  });

  @override
  // ignore: todo
  // TODO: implement props
  List<Object?> get props => [
        arti,
        asma,
        audio,
        ayat,
        keterangan,
        nama,
        nomor,
        rukuk,
        type,
        rukuk,
      ];
}
