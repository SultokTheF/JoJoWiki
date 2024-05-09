import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle textStyle = TextStyle(
    fontFamily: 'JoJoFont',
    fontSize: 15,
  );

  static ButtonStyle elevatedButtonStyle(BuildContext context) => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
        overlayColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColorDark),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        textStyle: MaterialStateProperty.all<TextStyle>(textStyle),
      );
}
