extension DateFormatX on DateTime {
  String getDate() {
    return toIso8601String().substring(0, 10);
  }
}
