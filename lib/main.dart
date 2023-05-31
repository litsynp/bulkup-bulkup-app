import 'package:bulkup_bulkup/routes.dart';
import 'package:flutter/material.dart';

import 'ui/theme.dart';
import 'widgets/app_bar.dart';
import 'widgets/statistics_box.dart';
import 'widgets/diary_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '벌크업 벌크업',
      routes: Routes.build(),
      home: Scaffold(
        appBar: CustomAppBar.build('벌크업 벌크업'),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      '오션님,\n환영합니다 💪',
                      style: TextStyle(
                        fontSize: 48,
                        fontFamily: Font.primaryFont,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          '요약 차트',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: Font.primaryFont,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const StatisticsBox(),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          '나의 일지',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: Font.primaryFont,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [1, 2, 3, 4]
                            .map((diaryId) => Column(children: [
                                  DiaryBox(diaryId: diaryId.toString()),
                                  const SizedBox(height: 20)
                                ]))
                            .toList()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
