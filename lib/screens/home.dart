import 'dart:ui';

import 'package:corona/configs/constant.dart';
import 'package:corona/configs/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(bottom: 20, top: 70, right: 10),
              width: double.infinity,
              height: 0.5 * size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFF3383CD),
                    Color(0xFF11249F),
                  ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                  image:
                      DecorationImage(image: AssetImage(custom_images.virus))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(custom_images.menu)),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Stack(
                    children: [
                      SvgPicture.asset(
                        custom_images.sittingGuy,
                        width: size.width * 0.65,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                      Positioned(
                          top: 45,
                          left: 160,
                          child: Text("All This Need \n Stay at Home",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w600))),
                      Container()
                    ],
                  ))
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xFFE5E5E5))),
            child: Row(
              children: [
                SvgPicture.asset(custom_images.flags),
                Expanded(
                    child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  value: countries[0],
                  items: countries
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {},
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(text: "Case Update", style: kTitleTextstyle),
                      TextSpan(
                          text: "\nNewest Update March 29",
                          style: TextStyle(color: kTextLightColor)),
                    ])),
                    Spacer(),
                    Text(
                      "See Details",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 38,
                            color: kShadowColor)
                      ]),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CoronaBox(),
                        CoronaBox(),
                        CoronaBox(),
                      ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CoronaBox extends StatelessWidget {
  const CoronaBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(6),
        height: 25,
        width: 25,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: kInfectedColor.withOpacity(.26)),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: kInfectedColor, width: 2)),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "2333",
        style: TextStyle(fontSize: 40, color: kInfectedColor),
      ),
      Text(
        "Infected",
        style: kSubTextStyle,
      )
    ]);
  }
}
