import 'package:flutter/widgets.dart';

import '../ui/theme.dart';

class DiaryBox extends StatelessWidget {
  String diaryId;

  DiaryBox({Key? key, required this.diaryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/diary', arguments: diaryId);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: 120,
            decoration: BoxDecoration(
              color: Palette.white,
              border: _solidBorders(),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  clipBehavior: Clip.hardEdge,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Palette.emptyGray,
                    border: _solidBorders(),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
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
