import 'package:bulkup_bulkup/models/diary_model.dart';
import 'package:bulkup_bulkup/utils/datetime_utils.dart';
import 'package:flutter/widgets.dart';

import '../ui/solid_borders.dart';
import '../ui/theme.dart';

class DiaryBox extends StatelessWidget {
  final Diary diary;

  const DiaryBox({Key? key, required this.diary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/diary', arguments: diary.id);
      },
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: 120,
            decoration: BoxDecoration(
              color: Palette.white,
              border: SolidBorders.build(),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  clipBehavior: Clip.hardEdge,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Palette.emptyGray,
                    border: SolidBorders.build(),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateTimeUtils.toReadableDate(
                            diary.createdAt.add(const Duration(hours: 9))),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        diary.content.length > 100
                            ? '${diary.content.substring(0, 100)}...'
                            : diary.content,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
