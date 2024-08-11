String formatCurrentDate() {
  DateTime now = DateTime.now();

  String year = now.year.toString();
  String month = now.month.toString().padLeft(2, '0');
  String day = now.day.toString().padLeft(2, '0');

  String formattedDate = '$year-$month-$day';
  return formattedDate;
}
