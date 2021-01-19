import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Shortcut methods for Navigator calls.
class NavigatorUtilities {
  static pushAndRemoveUntil(BuildContext context, WidgetBuilder builder) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: builder), (Route<dynamic> route) => false);
  }
}

typedef Widget GetWidget(BuildContext context);
