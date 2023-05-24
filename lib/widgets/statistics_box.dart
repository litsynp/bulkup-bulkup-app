import 'package:flutter/widgets.dart';

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
            border: _solidBorders(),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ],
    );
  }

  Border _solidBorders() {
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
