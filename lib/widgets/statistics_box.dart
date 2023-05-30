import 'package:flutter/widgets.dart';

import '../ui/solid_borders.dart';
import '../ui/theme.dart';

class StatisticsBox extends StatelessWidget {
  const StatisticsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Palette.white,
            border: SolidBorders.build(),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
