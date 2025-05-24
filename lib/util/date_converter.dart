import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateConverter {
  // for getting formatted time from milliSecondsSinceEpochs String
  static String getFormattedTime({required BuildContext context, required String time}) {
    final date = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    return TimeOfDay.fromDateTime(date).format(context);
  }

  // for getting formatted time for sent & read
  static String getMessageTime({required BuildContext context, required String time}) {
    final DateTime sent = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    final DateTime now = DateTime.now();

    final formattedTime = TimeOfDay.fromDateTime(sent).format(context);
    if (now.day == sent.day &&
        now.month == sent.month &&
        now.year == sent.year) {
      return formattedTime;
    }

    return now.year == sent.year
        ? '$formattedTime - ${sent.day} ${_getMonth(sent)}'
        : '$formattedTime - ${sent.day} ${_getMonth(sent)} ${sent.year}';
  }

  //get last message time (used in chat user card)
  static String getLastMessageTime({required BuildContext context, required String time, bool showYear = false}) {
    if(time.isEmpty) return '';
    final DateTime sent = DateTime.fromMillisecondsSinceEpoch(int.parse(time ));
    final DateTime now = DateTime.now();

    if (now.day == sent.day &&
        now.month == sent.month &&
        now.year == sent.year) {
      return TimeOfDay.fromDateTime(sent).format(context);
    }

    return showYear
        ? '${sent.day} ${_getMonth(sent)} ${sent.year}'
        : '${sent.day} ${_getMonth(sent)}';
  }

  //get formatted last active time of user in chat screen
  static String getLastActiveTime(
      {required BuildContext context, required String lastActive}) {
    final int i = int.tryParse(lastActive) ?? -1;

    //if time is not available then return below statement
    if (i == -1) return 'Last seen not available';

    DateTime time = DateTime.fromMillisecondsSinceEpoch(i);
    DateTime now = DateTime.now();

    String formattedTime = TimeOfDay.fromDateTime(time).format(context);
    if (time.day == now.day &&
        time.month == now.month &&
        time.year == time.year) {
      return 'Last seen today at $formattedTime';
    }

    if ((now.difference(time).inHours / 24).round() == 1) {
      return 'Last seen yesterday at $formattedTime';
    }

    String month = _getMonth(time);

    return 'Last seen on ${time.day} $month on $formattedTime';
  }

  static String getUserLastActiveTime(
      {required BuildContext context, required String lastActive}) {
    final int i = int.tryParse(lastActive) ?? -1;

    //if time is not available then return below statement
    if (i == -1) return '';

    DateTime time = DateTime.fromMillisecondsSinceEpoch(i);
    DateTime now = DateTime.now();

    String formattedTime = TimeOfDay.fromDateTime(time).format(context);
    if (time.day == now.day &&
        time.month == now.month &&
        time.year == time.year) {
      return formattedTime;
    }

    if ((now.difference(time).inHours / 24).round() == 1) {
      return formattedTime;
    }

    String month = _getMonth(time);

    return 'Last seen on ${time.day} $month on $formattedTime';
  }


  static String getTimeAgo(int timestamp) {
    DateTime messageTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    DateTime now = DateTime.now();
    Duration difference = now.difference(messageTime);

    if (difference.inSeconds < 60) {
      return "${difference.inSeconds}s ago";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes}m ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours}hr ago";
    } else if (difference.inDays == 1) {
      return "Yesterday";
    } else if (difference.inDays < 7) {
      return "${difference.inDays}days ago";
    } else {
      return DateFormat('dd MMM yyyy, hh:mm a').format(messageTime);
    }
  }
  // get month name from month no. or index
  static String _getMonth(DateTime date) {
    switch (date.month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sept';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
    }
    return 'NA';
  }

  static String convertTaskDateTime(DateTime dateTime) {
    return DateFormat('MMM dd,yyyy').format(dateTime);
  }


  static String convertActivityDateTime(String? dateTime) {
    if (dateTime == null || dateTime.isEmpty) return 'Invalid date';

    try {
      DateTime parsedDate = DateFormat('dd MMM, yyyy').parse(dateTime);
      return DateFormat('dd MMM').format(parsedDate);
    } catch (e) {
      return 'Invalid date';
    }
  }

  static DateTime convertToCustomFormat(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute, 0);
  }
  static String convertTaskTime(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);

    return DateFormat('hh:mm a').format(dateTime); // Formats as 12-hour time with AM/PM
  }


  static DateTime? parseCustomDateFormat(String? dateString) {
    if(dateString == null) return DateTime.now();
    try {
      return DateFormat("dd MMM, yyyy").parse(dateString);
    } catch (e) {
      debugPrint("Error parsing date: $e");
      return null;
    }
  }

  static DateTime? combineDate(String? dateStr, String? timeStr) {
    if (dateStr == null || timeStr == null) return null;

    try {
      // Example format: "26 Feb, 2025"
      DateFormat dateFormat = DateFormat("dd MMM, yyyy");
      DateTime parsedDate = dateFormat.parse(dateStr);

      // Example time format: "06:10 AM"
      DateFormat timeFormat = DateFormat("hh:mm a");
      DateTime parsedTime = timeFormat.parse(timeStr);

      // Combine Date and Time
      return DateTime(parsedDate.year, parsedDate.month, parsedDate.day, parsedTime.hour, parsedTime.minute);
    } catch (e) {
      print("Error parsing date/time: $e");
      return null;
    }
  }


  static DateTime? combineDateTime(String? dateStr, String? timeStr) {

    if(dateStr == null || timeStr == null) return null;
    // Step 1: Parse the date string
    DateTime parsedDate = DateFormat("dd MMM, yyyy").parse(dateStr);

    // Step 2: Parse the time string
    DateTime parsedTime = DateFormat("hh:mm a").parse(timeStr);

    // Step 3: Combine both into a single DateTime object
    DateTime finalDateTime = DateTime(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
      parsedTime.hour,
      parsedTime.minute,
      parsedTime.second,
    );

    return finalDateTime;
  }


  static TimeOfDay parseTimeOfDay(String? timeString) {
    if(timeString == null) return TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
    final timeFormat = RegExp(r'(\d+):(\d+) (\w{2})'); // Regular expression to capture the hour, minute, and AM/PM

    final match = timeFormat.firstMatch(timeString);
    if (match != null) {
      final hour = int.parse(match.group(1)!);
      final minute = int.parse(match.group(2)!);
      final period = match.group(3);

      // Convert hour for 12-hour to 24-hour format
      int adjustedHour = hour;
      if (period == "PM" && hour != 12) {
        adjustedHour += 12;
      } else if (period == "AM" && hour == 12) {
        adjustedHour = 0;
      }
      return TimeOfDay(hour: adjustedHour, minute: minute);
    }

    throw const FormatException("Invalid time format");
  }

  static differentValue(DateTime dateTime1, DateTime dateTime2) {
    // Given DateTime values
    //DateTime dateTime1 = DateTime(2025, 3, 7, 17, 55, 0); // 5:55 PM
    //DateTime dateTime2 = DateTime(2025, 3, 7, 18, 18, 0); // 6:18 PM

    // Calculate difference
    bool difference = dateTime2.isAfter(dateTime1);

    // Extract hours and minutes
    // int hours = difference.inHours;
    // int minutes = difference.inMinutes % 60;

    print("Time Difference: ${difference} hours and");
  }

}
