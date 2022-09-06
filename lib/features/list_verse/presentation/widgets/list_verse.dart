import 'package:alquran_mobile_apps/features/list_verse/domain/entities/single_verse_data.dart';
import 'package:alquran_mobile_apps/features/list_verse/domain/entities/verse_data.dart';
import 'package:alquran_mobile_apps/features/list_verse/presentation/bloc/list_verse_bloc.dart';
import 'package:alquran_mobile_apps/features/quran/domain/entities/quran_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/function.dart';

class ListVerse extends StatelessWidget {
  const ListVerse({
    Key? key,
    required this.verseData,
    required this.quranData,
  }) : super(key: key);

  final VerseData verseData;
  final QuranData quranData;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFFFDF5),
      child: InkWell(
        onLongPress: () {
          context.read<ListVerseBloc>().add(
                OnMarkerSurah(
                  SingleVerseData(
                    verseId: verseData.id,
                    surahId: quranData.nomor,
                    nama: quranData.nama,
                  ),
                ),
              );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Func.getHeight(context, 9),
            horizontal: Func.getWidth(context, 12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Func.getWidth(context, 37),
                height: Func.getHeight(context, 37),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/vector/number.png",
                      width: Func.getWidth(context, 37),
                      height: Func.getHeight(context, 37),
                    ),
                    Center(
                      child: Text(
                        verseData.nomor,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFDA8856),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Func.getWidth(context, 4),
              ),
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        verseData.ar,
                        //locale: const Locale('ar', 'AE'),
                        style: TextStyle(
                          fontFamily: "Amiri",
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 20,
                          height: Func.getHeight(context, 2.5),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    SizedBox(
                      height: Func.getHeight(context, 12),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        verseData.id,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          color: const Color(0xFF292C29).withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
