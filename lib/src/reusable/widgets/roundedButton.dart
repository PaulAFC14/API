import 'package:aco/src/reusable/methods/routes.dart';
import 'package:flutter/material.dart';

class WinRoundedButton extends Widget {
  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }

  late Color backgroundColor;
  late Color color;
  late String txt;
  late double height;
  late double width;

  WinRoundedButton(
      {required this.backgroundColor,
      required this.color,
      required this.txt,
      required this.height,
      required this.width});

  Widget TextButton(BuildContext context,
      {required onPressed(), required double fontSize}) {
    double wd = MediaQuery.of(context).size.width;
    wd = wd - 50;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: backgroundColor,
            textStyle: TextStyle(color: color),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(height))),
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: (height - fontSize) / 2.1),
          width: width == 0 ? double.infinity : width,
          height: height,
          child: Text(
            txt,
            textAlign: TextAlign.center,
            style: TextStyle(color: color, fontSize: fontSize),
          ),
        ));
  }

  Widget IconTextButton(BuildContext context,
      {required onPressed(), required double fontSize, required Icon icon}) {
    double wd = MediaQuery.of(context).size.width;
    wd = wd - 50;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: backgroundColor,
            textStyle: TextStyle(color: color),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(height))),
        onPressed: onPressed,
        child: Container(
          width: width == 0 || width >= wd ? double.infinity : width,
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: <Widget>[
                    icon,
                    SizedBox(width: fontSize),
                    Text(
                      txt,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: color, fontSize: fontSize,
                      fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded, color: color,)
              
            ],
          ),
        ));
  }

  Widget SingleIconTextButton(BuildContext context,
      {required onPressed(), required double fontSize, required Icon icon}) {
    double wd = MediaQuery.of(context).size.width;
    double vw = wd/100;
    wd = wd - 4*vw;

    return Container(
      margin: width == 0
      ? EdgeInsets.zero
      : EdgeInsets.symmetric(horizontal: (wd-width)/2)
      ,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: backgroundColor,
              textStyle: TextStyle(color: color),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(height))),
          onPressed: onPressed,
          child: Container(
            width: width == 0 || width >= wd ? double.infinity : width,
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icon,
                Text(
                  txt,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: color, fontSize: fontSize,
                  fontWeight: FontWeight.w500
                  ),
                ),
              ]
            ),
          )),
    );
  }

  Widget ImgTextButton(BuildContext context,
      {required onPressed(), required double fontSize, required String path}) {
    double wd = MediaQuery.of(context).size.width;
    wd = wd - 50;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: backgroundColor,
            textStyle: TextStyle(color: color),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(height))),
        onPressed: onPressed,
        child: Container(
          width: width == 0 || width >= wd ? double.infinity : width,
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: fontSize, height: fontSize, child: Image.asset(path)),
              SizedBox(width: fontSize),
              Text(
                txt,
                textAlign: TextAlign.center,
                style: TextStyle(color: color, fontSize: fontSize),
              ),
            ],
          ),
        ));
  }
}
