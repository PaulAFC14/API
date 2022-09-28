import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  Widget generateInputForm(BuildContext context,
      {required TextEditingController controller,
      required bool hide,
      required String hint,
      required double width,
      required double height,
      required double marginH,
      required double fontsize,
      required Color color,
      required int type,
      required bool end}) {
    double wd = MediaQuery.of(context).size.width;
    wd = wd - marginH;

    return Container(
      width: width == 0 || width >= wd ? double.infinity : width,
      height: height,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(height)),
      child: TextFormField(
        controller: controller,
        obscureText: hide,
        keyboardType: type == 0
            ? TextInputType.emailAddress
            : type == 1
                ? TextInputType.visiblePassword
                : type == 2
                    ? TextInputType.text
                    : TextInputType.phone,

        textInputAction: end ? TextInputAction.send : TextInputAction.next,

        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.black, fontSize: fontsize),
        cursorColor: Theme.of(context).primaryColor,
        //cursorRadius: const Radius.circular(2),
        cursorWidth: 1,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black),
            contentPadding: EdgeInsets.only(left: wd / 20),
            /*enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.orange.shade900)),*/
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(height),
              borderSide: BorderSide(
                  color: Theme.of(context).primaryColor, width: 0.05 * height),
            )),
      ),
    );
  }

  Widget EmptyLabel(BuildContext context,
      {required String label, required bool active}) {
    if (active) {
      return Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 20),
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: TextStyle(color: Theme.of(context).errorColor),
          ));
    } else {
      return Container();
    }
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
