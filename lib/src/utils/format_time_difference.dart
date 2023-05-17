String formatTimeDifference(DateTime time) {
  final now = DateTime.now();
  final difference = now.difference(time);

  final months = (difference.inDays / 30).round();

  if (months > 0) {
    return 'Il y a $months mois';
  } else if (difference.inDays > 0) {
    return 'Il y a ${difference.inDays} jours';
  } else if (difference.inHours > 0) {
    return 'Il y a ${difference.inHours} heures';
  } else if (difference.inMinutes > 0) {
    return 'Il y a ${difference.inMinutes} minutes';
  } else {
    return 'Il y a ${difference.inSeconds} secondes';
  }
}
