import 'package:flutter/material.dart';

import '../../../../core/utils/function.dart';

class ListVerse extends StatelessWidget {
  const ListVerse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        top: MyFunction.getHeight(context, 18),
        left: MyFunction.getWidth(context, 12),
        right: MyFunction.getWidth(context, 12),
      ),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MyFunction.getWidth(context, 37),
            height: MyFunction.getHeight(context, 37),
            child: Stack(
              children: [
                Image.asset(
                  "assets/vector/number.png",
                  width: MyFunction.getWidth(context, 37),
                  height: MyFunction.getHeight(context, 37),
                ),
                Center(
                  child: Text(
                    "1",
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
            width: MyFunction.getWidth(context, 4),
          ),
          Column(
            children: [
              const Text(
                'مْيِحَّﺮﻟا ِنٰمْحَّﺮﻟا ِهّٰﻞﻟا ِمْسِب',
                locale: Locale('ar', 'AE'),
                style: TextStyle(
                  fontFamily: "Amiri",
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: MyFunction.getHeight(context, 12),
              ),
              Text(
                "Dengan nama",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  color: const Color(0xFF292C29).withOpacity(0.6),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
