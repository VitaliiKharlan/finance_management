String formatDate(DateTime? date) {
  if (date == null) {
    return 'Invalid date';
  }

  const months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  int month = date.month;
  int day = date.day;
  int year = date.year;

  if (month < 1 || month > 12) {
    return 'Invalid month';
  }

  int maxDay = DateTime(year, month + 1, 0).day;
  if (day < 1 || day > maxDay) {
    return 'Invalid day';
  }

  return '${months[month - 1]} $day, $year';
}
