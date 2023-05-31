import 'package:flutter/material.dart';

import '../ui/theme.dart';

class CustomAppBar {
  static build(String text) {
    return AppBar(
      title: Text(text),
      backgroundColor: Palette.primaryColor,
    );
  }
}
