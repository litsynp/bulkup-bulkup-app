import 'package:bulkup_bulkup/models/diary_model.dart';
import 'package:bulkup_bulkup/services/diary_service.dart';
import 'package:flutter/material.dart';

import '../ui/solid_borders.dart';
import '../ui/theme.dart';
import '../widgets/app_bar.dart';

class DiaryDetailScreen extends StatelessWidget {
  late int diaryId;
  late Future<Diary> diary;

  init() async {
    diary = DiaryService.findDiaryById(diaryId);
  }

  DiaryDetailScreen({Key? key, required String diaryId}) : super(key: key) {
    this.diaryId = int.parse(diaryId);
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build('${diaryId}번 일지'),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: diary,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildDiaryLabel('운동 사진'),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                ...List.generate(
                                  5,
                                  (index) => Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      color: Palette.emptyGray,
                                      border: SolidBorders.build(),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 33),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildDiaryLabel('체중'),
                          const SizedBox(height: 10),
                          buildDiaryText('${snapshot.data!.weight}kg')
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildDiaryLabel('아침'),
                          const SizedBox(height: 10),
                          buildDiaryText(snapshot.data!.breakfast)
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildDiaryLabel('점심'),
                          const SizedBox(height: 10),
                          buildDiaryText(snapshot.data!.lunch)
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildDiaryLabel('저녁'),
                          const SizedBox(height: 10),
                          buildDiaryText(snapshot.data!.dinner)
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildDiaryLabel('기타 식단'),
                          const SizedBox(height: 10),
                          buildDiaryText(snapshot.data!.otherMeals)
                        ],
                      ),
                      const SizedBox(height: 33),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          buildDiaryLabel('내용'),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: Palette.emptyGray,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 100,
                            height: 400,
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              snapshot.data!.content,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  Text buildDiaryLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Text buildDiaryText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
      ),
    );
  }
}
