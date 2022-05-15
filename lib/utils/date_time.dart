extension DateTimeExtension on DateTime {
  String getTimeAgo() {
    final currentTime = DateTime.now();
    final difference = currentTime.difference(this);

    // Check For Weeks Ago
    if ((difference.inDays / 7).floor() >= 1) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    }

    // Check For Days Ago is Yesterday
    else if (difference.inDays == 1) {
      return 'Yesterday';
    }

    // Check For Days Ago is more than one day
    else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    }

    // Check For Hour Ago
    else if (difference.inHours >= 1) {
      return '${difference.inHours} hour ago';
    }

    // Check For Minutes Ago
    else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} minute ago';
    }

    // Check For Seconde Ago
    else if (difference.inSeconds >= 1) {
      return '${difference.inSeconds} second ago';
    }

    // -
    else {
      return "Just now";
    }
  }
}
