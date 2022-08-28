import 'package:flutter/material.dart';

import '../../core/utils/function.dart';
import '../quran/presentation/pages/quran_menu_page.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({Key? key}) : super(key: key);

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xffFFBF8A), Color(0xffD38545)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF5),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Func.getWidth(context, 24),
        ),
        child: Column(
          children: [
            SizedBox(
              height: Func.getHeight(context, 48),
            ),
            Text(
              "Ahlul Quran",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                foreground: Paint()..shader = linearGradient,
              ),
            ),
            SizedBox(
              height: Func.getHeight(context, 28),
            ),
            SizedBox(
              height: Func.getHeight(context, 156),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: Func.getHeight(context, 140),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDA8856),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  Positioned(
                    right: Func.getWidth(context, 24),
                    child: Image.asset(
                      "assets/vector/petik.png",
                      width: Func.getWidth(context, 40.63),
                      height: Func.getHeight(context, 32),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: Func.getHeight(context, 140),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          opacity: 0.15,
                          image: AssetImage(
                            "assets/vector/bg_motivation.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: Func.getHeight(context, 140),
                      padding: EdgeInsets.symmetric(
                        vertical: Func.getHeight(context, 24),
                        horizontal: Func.getWidth(context, 24),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/vector/small_book.png",
                                width: Func.getWidth(context, 20),
                                height: Func.getHeight(context, 20),
                              ),
                              SizedBox(
                                width: Func.getWidth(context, 9),
                              ),
                              const Text(
                                "Motivasi",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            "Sebaik - baik manusia diantara kamu adalah yang mempelajari Al-Quran dan mengajarkannya (HR Bukhori)",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Func.getHeight(context, 28),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return const QuranMenuPage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: Func.getWidth(context, 152),
                        height: Func.getHeight(context, 186),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xFFDA8856),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 15,
                              color: const Color(0xFFE9A983).withOpacity(0.15),
                            )
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: Func.getWidth(context, -65),
                              top: Func.getHeight(context, -8),
                              child: Image.asset(
                                "assets/vector/ornament_white.png",
                                width: Func.getWidth(context, 137.26),
                                height: Func.getHeight(
                                  context,
                                  146,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Func.getHeight(context, 18),
                                horizontal: Func.getWidth(context, 18),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/vector/book_white.png",
                                    width: Func.getWidth(context, 43.15),
                                    height: Func.getHeight(context, 51),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    "Al Quran",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Func.getHeight(context, 20),
                    ),
                    Container(
                      width: Func.getWidth(context, 152),
                      height: Func.getHeight(context, 155),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 15,
                            color: const Color(0xFFE9A983).withOpacity(0.15),
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: Func.getWidth(context, -70),
                            top: Func.getHeight(context, -8),
                            child: Image.asset(
                              "assets/vector/ornament_brown.png",
                              width: Func.getWidth(context, 137.26),
                              height: Func.getHeight(
                                context,
                                146,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Func.getHeight(context, 18),
                              horizontal: Func.getWidth(context, 18),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/vector/search.png",
                                  width: Func.getWidth(context, 51),
                                  height: Func.getHeight(context, 51),
                                ),
                                const Spacer(),
                                const Text(
                                  "Pencarian",
                                  style: TextStyle(
                                    color: Color(0xFFDA8856),
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Container(
                      width: Func.getWidth(context, 152),
                      height: Func.getHeight(context, 155),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 15,
                            color: const Color(0xFFE9A983).withOpacity(0.15),
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: Func.getWidth(context, -70),
                            top: Func.getHeight(context, -8),
                            child: Image.asset(
                              "assets/vector/ornament_brown.png",
                              width: Func.getWidth(context, 137.26),
                              height: Func.getHeight(
                                context,
                                146,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Func.getHeight(context, 18),
                              horizontal: Func.getWidth(context, 18),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/vector/head.png",
                                  width: Func.getWidth(context, 51),
                                  height: Func.getHeight(context, 51),
                                ),
                                const Spacer(),
                                const Text(
                                  "Hafalan",
                                  style: TextStyle(
                                    color: Color(0xFFDA8856),
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Func.getHeight(
                        context,
                        20,
                      ),
                    ),
                    Container(
                      width: Func.getWidth(context, 152),
                      height: Func.getHeight(context, 186),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xFFDA8856),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 15,
                            color: const Color(0xFFE9A983).withOpacity(0.15),
                          )
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: Func.getWidth(context, -65),
                            top: Func.getHeight(context, -8),
                            child: Image.asset(
                              "assets/vector/ornament_white.png",
                              width: Func.getWidth(context, 137.26),
                              height: Func.getHeight(
                                context,
                                146,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Func.getHeight(context, 18),
                              horizontal: Func.getWidth(context, 18),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/vector/dashboard.png",
                                  width: Func.getWidth(context, 43.15),
                                  height: Func.getHeight(context, 51),
                                ),
                                const Spacer(),
                                const Text(
                                  "Dashboard",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
