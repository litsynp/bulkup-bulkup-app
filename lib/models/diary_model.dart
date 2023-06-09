import 'package:bulkup_bulkup/models/image_model.dart';

class Diary {
  final int? id;
  final DateTime createdAt;
  final double weight;
  final String breakfast;
  final String lunch;
  final String dinner;
  final String otherMeals;
  final String content;
  late List<Image> images = [];

  Diary({
    this.id,
    required this.createdAt,
    required this.weight,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
    required this.otherMeals,
    required this.content,
    this.images = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt.toString(),
      'weight': weight,
      'breakfast': breakfast,
      'lunch': lunch,
      'dinner': dinner,
      'otherMeals': otherMeals,
      'content': content,
    };
  }

  static Diary fromJson(Map<String, dynamic> map) {
    return Diary(
      id: map['id'],
      createdAt: DateTime.parse(map['created_at']),
      weight: map['weight'],
      breakfast: map['breakfast'],
      lunch: map['lunch'],
      dinner: map['dinner'],
      otherMeals: map['other_meals'],
      content: map['content'],
      images: map['images'] != null
          ? List<Image>.from(map['images'].map((x) => Image.fromJson(x)))
          : [],
    );
  }
}

class DiaryStatItem {
  final int? id;
  final DateTime createdAt;
  final double weight;

  DiaryStatItem({
    this.id,
    required this.createdAt,
    required this.weight,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt.toString(),
      'weight': weight,
    };
  }

  static DiaryStatItem fromJson(Map<String, dynamic> map) {
    return DiaryStatItem(
      id: map['id'],
      createdAt: DateTime.parse(map['created_at']),
      weight: map['weight'],
    );
  }
}
