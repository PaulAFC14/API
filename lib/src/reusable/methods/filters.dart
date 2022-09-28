import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Filters {
  String getInputValue(TextEditingController controller) {
    String value = controller.toString();
    String v = '';
    int a = 0, b = 0;

    for (int i = 0; i < value.length; i++) {
      if (value[i] == '┤') {
        a = i + 1;
      }
      if (value[i] == '├') {
        b = i;
      }
    }

    for (int i = a; i < b; i++) {
      v += value[i];
    }

    return v;
  }

  bool checkColection({required List<String> colecctcion}) {
    int r = 0;
    for (int i = 0; i < colecctcion.length; i++) {
      if (colecctcion[i].isNotEmpty) {
        r++;
      }
    }

    if (r == colecctcion.length) {
      return true;
    } else {
      return false;
    }
  }

  Color EmptyInputColor(BuildContext context, String value) {
    if (value.isEmpty) {
      return Theme.of(context).cardColor;
    } else {
      return Theme.of(context).backgroundColor;
    }
  }

  bool EmptyInputLabel(String value) {
    if (value.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
