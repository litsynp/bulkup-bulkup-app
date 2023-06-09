import 'dart:convert';

import 'package:bulkup_bulkup/models/diary_model.dart';
import "package:http/http.dart" as http;

import 'package:bulkup_bulkup/config.dart';

class DiaryService {
  static const String diariesUri = "/diaries";

  static Future<List<Diary>> findDiaries() async {
    final url = Uri.parse("${Config.apiUrl}$diariesUri");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to load diaries");
    }

    final dairiesJson = jsonDecode(response.body);
    List<Diary> diaries = [];
    for (var diary in dairiesJson['items']) {
      diaries.add(Diary.fromJson(diary));
    }

    return diaries;
  }

  static Future<Diary> findDiaryById(int id) async {
    final url = Uri.parse("${Config.apiUrl}$diariesUri/$id");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to load diary");
    }

    final diaryJson = jsonDecode(response.body);
    return Diary.fromJson(diaryJson);
  }

  static void createDiary(Diary diary) async {
    final url = Uri.parse("${Config.apiUrl}$diariesUri");
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(diary.toMap()),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to create diary");
    }
  }

  static void updateDiary(Diary diary) async {
    final url = Uri.parse("${Config.apiUrl}$diariesUri/${diary.id}");
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(diary.toMap()),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to update diary");
    }
  }

  static void deleteDiary(int id) async {
    final url = Uri.parse("${Config.apiUrl}$diariesUri/$id");
    final response = await http.delete(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to delete diary");
    }
  }

  static Future<List<DiaryStatItem>> findDiaryStats() async {
    final url = Uri.parse("${Config.apiUrl}$diariesUri/stats");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to load diary stats");
    }

    final diaryStatsJson = jsonDecode(response.body);
    List<DiaryStatItem> diaryStats = [];
    for (var diaryStat in diaryStatsJson['diaries']) {
      diaryStats.add(DiaryStatItem.fromJson(diaryStat));
    }

    return diaryStats;
  }
}
