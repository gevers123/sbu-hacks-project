class Date {
  late String year = '';
  late String month = '';
  late String day = '';

  Date() {
    this.year = year;
    this.month = month;
    this.day = day;
  }

  DateTime getTodaysDate() {
    DateTime today = DateTime.now();
    return today;
  }

  void setTodaysDate() {
    DateTime today = DateTime.now();
    this.year = today.year.toString();
    this.month = monthToString(today);
    this.day = dayToString(today);
  }

  String monthToString(DateTime date) {
    if (date.month < 10) {
      return '0' + date.month.toString();
    }

    return date.month.toString();
  }

  String dayToString(DateTime date) {
    if (date.day < 10) {
      return '0' + date.day.toString();
    }

    return date.day.toString();
  }

  String dateToString() {
    return this.year + '-' + this.month + '-' + this.day;
  }
}
