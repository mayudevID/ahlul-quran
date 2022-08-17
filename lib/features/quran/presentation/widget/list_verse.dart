import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/utils/function.dart';

class ListVerse extends StatelessWidget {
  const ListVerse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MyFunction.getWidth(context, 24),
      ),
      padding: EdgeInsets.symmetric(
        vertical: MyFunction.getWidth(context, 9),
      ),
      child: Row(
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
                const Center(
                  child: Text(
                    "1",
                    style: TextStyle(
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
            width: MyFunction.getWidth(context, 18),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Al Fatihah",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFDA8856),
                ),
              ),
              SizedBox(
                height: MyFunction.getHeight(context, 6),
              ),
              Row(
                children: [
                  Text(
                    "MEKKAH",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF292C29).withOpacity(0.6),
                    ),
                  ),
                  SizedBox(
                    width: MyFunction.getWidth(context, 5),
                  ),
                  Container(
                    width: MyFunction.getWidth(context, 4),
                    height: MyFunction.getHeight(context, 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFBBC4CE).withOpacity(0.35),
                    ),
                  ),
                  SizedBox(
                    width: MyFunction.getWidth(context, 5),
                  ),
                  Text(
                    "7 AYAT",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF292C29).withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
