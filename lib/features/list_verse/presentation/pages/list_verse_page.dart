import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/function.dart';
import '../../../../injection_container.dart';
import '../../../quran/data/models/quran_data_model.dart';
import '../../../quran/domain/entities/quran_data.dart';
import '../bloc/list_verse_bloc.dart';
import '../widgets/list_verse.dart';

class ListVersePage extends StatelessWidget {
  const ListVersePage({Key? key, required this.quranData}) : super(key: key);

  final QuranData quranData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ListVerseBloc>()
        ..add(
          OnGetVerseData(quranData.nomor),
        ),
      child: ListVersePageContent(
        quranData: quranData,
      ),
    );
  }
}

class ListVersePageContent extends StatelessWidget {
  const ListVersePageContent({Key? key, required this.quranData})
      : super(key: key);

  final QuranData quranData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF5),
      body: Column(
        children: [
          SizedBox(
            height: Func.getHeight(context, 48),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Func.getWidth(context, 24),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/vector/back.png",
                    width: Func.getWidth(context, 24.62),
                    height: Func.getHeight(context, 24),
                  ),
                ),
                SizedBox(
                  width: Func.getWidth(context, 18),
                ),
                Text(
                  "Juz ${Func.detectPartOfQuran(quranData)}",
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFDA8856),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    context.read<ListVerseBloc>().add(const OnReversedList());
                  },
                  child: BlocBuilder<ListVerseBloc, ListVerseState>(
                    builder: (context, state) {
                      return Image.asset(
                        "assets/vector/${(state.isListReversed) ? "asc" : "desc"}.png",
                        width: Func.getWidth(context, 24),
                        height: Func.getHeight(context, 24),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: Func.getWidth(context, 18),
                ),
                Image.asset(
                  "assets/vector/unduh.png",
                  width: Func.getWidth(context, 24),
                  height: Func.getHeight(context, 24),
                ),
                SizedBox(
                  width: Func.getWidth(context, 18),
                ),
                Image.asset(
                  "assets/vector/list.png",
                  width: Func.getWidth(context, 24.63),
                  height: Func.getHeight(context, 24),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Func.getHeight(context, 8),
          ),
          Center(
            child: Text(
              "${quranData.nomor}. ${quranData.nama}",
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFFDA8856),
              ),
            ),
          ),
          SizedBox(
            height: Func.getHeight(context, 8),
          ),
          Container(
            height: Func.getHeight(context, 69),
            decoration: const BoxDecoration(
              color: Color(0xFFDA8856),
            ),
            child: Row(
              children: [
                Transform.translate(
                  offset: Offset(Func.getWidth(context, -26.5), 0),
                  child: Image.asset(
                    "assets/vector/ornament-surah.png",
                    width: Func.getWidth(context, 53),
                    height: Func.getHeight(context, 53),
                  ),
                ),

                Text(
                  (quranData.type == VerseType.MADINAH) ? "Madinah" : "Mekkah",
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/vector/tittle.png",
                        width: Func.getWidth(context, 173.25),
                        height: Func.getHeight(context, 45),
                      ),
                      Text(
                        quranData.arti,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: Func.resizeMeanText(context, quranData),
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   width: Func.getWidth(context, 11.92),
                // ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      quranData.ayat.toString(),
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: Func.getHeight(context, 3),
                    ),
                    const Text(
                      "Ayat",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Transform.translate(
                  offset: Offset(Func.getWidth(context, 26.5), 0),
                  child: Image.asset(
                    "assets/vector/ornament-surah.png",
                    width: Func.getWidth(context, 53),
                    height: Func.getHeight(context, 53),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<ListVerseBloc, ListVerseState>(
              builder: (context, state) {
                if (state.loadStatus == LoadStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFDA8856),
                    ),
                  );
                } else if (state.loadStatus == LoadStatus.loaded) {
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      itemCount: state.listVerse.length,
                      itemBuilder: (context, index) {
                        return ListVerse(
                          verseData: state.listVerse[index],
                        );
                      },
                    ),
                  );
                } else if (state.loadStatus == LoadStatus.error) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                } else {
                  return const Center(
                    child: Text("Initialize"),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
