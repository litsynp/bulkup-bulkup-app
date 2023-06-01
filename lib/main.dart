import 'package:bulkup_bulkup/models/diary_model.dart';
import 'package:bulkup_bulkup/routes.dart';
import 'package:bulkup_bulkup/services/diary_service.dart';
import 'package:flutter/material.dart';

import 'ui/theme.dart';
import 'widgets/app_bar.dart';
import 'widgets/statistics_box.dart';
import 'widgets/diary_box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<List<Diary>> diaries = DiaryService.findDiaries();

  ListView _buildDiaryList(AsyncSnapshot<List<Diary>> snapshot) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return DiaryBox(diary: snapshot.data![index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: snapshot.data?.length ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '벌크업 벌크업',
      routes: Routes.build(),
      home: Scaffold(
        appBar: CustomAppBar.build('벌크업 벌크업'),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
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
                    SizedBox(
                      height: 500,
                      child: FutureBuilder(
                        future: diaries,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return _buildDiaryList(snapshot);
                          }

                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
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
