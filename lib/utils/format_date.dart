String formatDate(String dateStr) {
  try {
    final date = DateTime.parse(dateStr);
    return '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  } catch (e) {
    return dateStr;
  }
}
