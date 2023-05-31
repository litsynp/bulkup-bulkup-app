import 'package:flutter/material.dart';

import '../ui/solid_borders.dart';
import '../ui/theme.dart';
import '../widgets/app_bar.dart';

class DiaryDetailScreen extends StatelessWidget {
  String diaryId;

  DiaryDetailScreen({Key? key, required this.diaryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build('2023년 5월 22일 ($diaryId)'),
      body: SingleChildScrollView(
        child: Container(
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
              Row(
                children: [
                  buildDiaryLabel('체중'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  buildDiaryLabel('아침'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  buildDiaryLabel('점심'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  buildDiaryLabel('저녁'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  buildDiaryLabel('기타 식단'),
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
                  )
                ],
              ),
            ],
          ),
        ),
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
}
