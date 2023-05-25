import 'package:flutter/widgets.dart';

import 'screens/DiaryDetailScreen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> build() {
    return {
      '/diary': (context) => DiaryDetailScreen(
            diaryId: ModalRoute.of(context)!.settings.arguments.toString(),
          ),
    };
  }
}
