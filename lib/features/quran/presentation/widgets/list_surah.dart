import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/function.dart';
import '../../../list_verse/presentation/pages/list_verse_page.dart';
import '../../data/models/quran_data_model.dart';
import '../../domain/entities/quran_data.dart';
import '../bloc/quran_bloc.dart';

class ListSurah extends StatelessWidget {
  const ListSurah({
    Key? key,
    required this.quranData,
  }) : super(key: key);

  final QuranData quranData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return ListVersePage(
                quranData: quranData,
                quranBloc: context.read<QuranBloc>(),
              );
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Func.getWidth(context, 24),
        ),
        padding: EdgeInsets.only(
          top: Func.getWidth(context, 9),
        ),
        child: Column(
          children: [
            Row(
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
                          quranData.nomor,
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
                  width: Func.getWidth(context, 18),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quranData.nama,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFDA8856),
                        ),
                      ),
                      SizedBox(
                        height: Func.getHeight(context, 6),
                      ),
                      Row(
                        children: [
                          Text(
                            (quranData.type == VerseType.MADINAH)
                                ? "MADINAH"
                                : "MEKKAH",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF292C29).withOpacity(0.6),
                            ),
                          ),
                          SizedBox(
                            width: Func.getWidth(context, 5),
                          ),
                          Container(
                            width: Func.getWidth(context, 4),
                            height: Func.getHeight(context, 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFBBC4CE).withOpacity(0.35),
                            ),
                          ),
                          SizedBox(
                            width: Func.getWidth(context, 5),
                          ),
                          Text(
                            "${quranData.ayat} AYAT",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF292C29).withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    quranData.asma,
                    style: const TextStyle(
                      fontFamily: "Amiri",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFDA8856),
                    ),
                  ),
                ),
                SizedBox(
                  width: Func.getWidth(context, 18),
                ),
                BlocBuilder<QuranBloc, QuranState>(
                  builder: (context, state) {
                    if (state.audioTargetNumber ==
                            int.tryParse(quranData.nomor) &&
                        state.isPlaying) {
                      return Container();
                    } else {
                      return GestureDetector(
                        onTap: () {
                          context.read<QuranBloc>().add(
                                OnStartRecite(quranData),
                              );
                        },
                        child: Image.asset(
                          "assets/vector/sound.png",
                          width: Func.getWidth(context, 24),
                          height: Func.getWidth(context, 24),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: Func.getHeight(context, 7),
            ),
            Divider(
              height: 2,
              color: const Color(0xFFBBC4CE).withOpacity(0.35),
            ),
          ],
        ),
      ),
    );
  }
}
