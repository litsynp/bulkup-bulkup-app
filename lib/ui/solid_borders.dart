import 'package:flutter/widgets.dart';

import 'package:bulkup_bulkup/ui/theme.dart';

class SolidBorders {
  static Border build() {
    return const Border(
      top: BorderSide(
        color: Palette.black,
        width: 1,
      ),
      left: BorderSide(
        color: Palette.black,
        width: 1,
      ),
      right: BorderSide(
        color: Palette.black,
        width: 1,
      ),
      bottom: BorderSide(
        color: Palette.black,
        width: 1,
      ),
    );
  }
}
