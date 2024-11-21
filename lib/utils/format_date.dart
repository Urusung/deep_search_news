String formatDate(String dateStr) {
  try {
    final date = DateTime.parse(dateStr);
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inHours < 24) {
      if (difference.inHours == 0) {
        final minutes = difference.inMinutes;
        return '$minutes분전';
      }
      return '${difference.inHours}시간전';
    }

    return '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  } catch (e) {
    return dateStr;
  }
}
