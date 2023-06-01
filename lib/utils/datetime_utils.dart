class DateTimeUtils {
  static String toReadableDate(DateTime date) {
    return '${date.year}년 ${date.month}월 ${date.day}일 ${date.hour}시 ${date.minute}분';
  }
}
