import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/utils/function.dart';

class ListVersePage extends StatelessWidget {
  const ListVersePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListVersePageContent();
  }
}

class ListVersePageContent extends StatelessWidget {
  const ListVersePageContent({Key? key}) : super(key: key);

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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/vector/back.png",
                    width: MyFunction.getWidth(context, 24.62),
                    height: MyFunction.getHeight(context, 24),
                  ),
                ),
                SizedBox(
                  width: MyFunction.getWidth(context, 18),
                ),
                const Text(
                  "Juz 1",
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
                  "assets/vector/unduh.png",
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
            height: MyFunction.getHeight(context, 8),
          ),
          Center(
            child: Text(
              "1. Al Fatihah",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFFDA8856),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
