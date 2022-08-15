import 'package:alquran_mobile_apps/core/utils/function.dart';
import 'package:alquran_mobile_apps/features/quran/presentation/pages/curve_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuranMenuPage extends StatelessWidget {
  const QuranMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuranMenuPageContent();
  }
}

class QuranMenuPageContent extends StatelessWidget {
  const QuranMenuPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF5),
      body: Column(
        children: [
          SizedBox(
            height: MyFunction.getHeight(context, 48),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MyFunction.getWidth(context, 24),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/vector/back.png",
                  width: MyFunction.getWidth(context, 24.62),
                  height: MyFunction.getHeight(context, 24),
                ),
                SizedBox(
                  width: MyFunction.getWidth(context, 18),
                ),
                const Text(
                  "Al Quran",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFDA8856),
                  ),
                ),
                const Spacer(),
                Image.asset(
                  "assets/vector/ascdesc.png",
                  width: MyFunction.getWidth(context, 24),
                  height: MyFunction.getHeight(context, 24),
                ),
                SizedBox(
                  width: MyFunction.getWidth(context, 18),
                ),
                Image.asset(
                  "assets/vector/list.png",
                  width: MyFunction.getWidth(context, 24.63),
                  height: MyFunction.getHeight(context, 24),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MyFunction.getHeight(context, 24),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MyFunction.getWidth(context, 24),
            ),
            child: SizedBox(
              height: MyFunction.getHeight(context, 131),
              child: Stack(
                children: [
                  Container(
                    height: MyFunction.getHeight(context, 131),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFE6DEC7),
                    ),
                  ),
                  ClipPath(
                    clipper: CurveClipper(),
                    child: Container(
                      width: MyFunction.getWidth(context, 210),
                      height: MyFunction.getHeight(context, 131),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: const Color(0xFFDA8856),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
