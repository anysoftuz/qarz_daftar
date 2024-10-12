import 'package:intl/intl.dart';
import 'package:qarz_daftar/data/models/home/given_amount_model.dart';
import 'package:qarz_daftar/data/models/home/graphic_statistics_model.dart';
import 'package:qarz_daftar/data/models/home/notification_model.dart';
import 'package:qarz_daftar/utils/log_service.dart';

class MyFunction {
  static String priceFormat(num data) {
    int price = data.toInt();
    String result = '';
    int count = 0;

    if (price == 0) {
      return '0';
    } else {
      for (int i = price.toString().length - 1; i >= 0; i--) {
        if (count == 3) {
          result = '${price.toString()[i]} $result';
          count = 0;
        } else {
          result = price.toString()[i] + result;
        }
        count++;
      }
      return result;
    }
  }

  static double kattason(List<GraphicStatisticsModel> graphicStatistics) {
    int kattasi = 0;
    for (var bir in graphicStatistics) {
      for (var element in bir.statistics) {
        if (kattasi < element.amount) {
          kattasi = element.amount;
        }
      }
    }

    return kattasi / 1000;
  }

  static String dateFormat(String date) {
    try {
      if (date.length == 10) {
        DateFormat dateFormat = DateFormat("dd.MM.yyyy");
        DateTime dateTime = dateFormat.parse(date);
        return DateFormat('dd.MM.yyyy HH:mm').format(dateTime);
      }

      DateTime dateTime = DateTime.parse(date).toLocal();

      String formattedDateTime =
          DateFormat('dd.MM.yyyy HH:mm').format(dateTime);

      return formattedDateTime;
    } catch (e) {
      return "";
    }
  }

  static int notificationLeng(List<NotificationModel> notification) {
    int count = 0;
    for (var element in notification) {
      if (element.confirmStatus != "active" &&
          element.confirmStatus != "confirm" &&
          element.confirmStatus != "closed" &&
          element.confirmStatus != "refusal") {
        count += 1;
      }
    }
    return count;
  }

  static List<NotificationModel> notificationList(
    List<NotificationModel> notifications,
  ) {
    List<NotificationModel> notification = [];
    for (var element in notifications) {
      if (element.confirmStatus != "active" &&
          element.confirmStatus != "confirm" &&
          element.confirmStatus != "closed" &&
          element.confirmStatus != "refusal") {
        notification.add(element);
      }
    }
    return notification;
  }

  static String dateFormatLed(String date) {
    DateFormat dateFormat = DateFormat("dd.MM.yyyy");
    DateTime dateTime = dateFormat.parse(date);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String dateFormatDate(String date) {
    DateTime dateTime = DateTime.parse(date).toLocal();

    String formattedDateTime = DateFormat('dd.MM.yyyy').format(dateTime);

    return formattedDateTime;
  }

  static int daysLeft(String date) {
    if (date.length == 10) {
      // Current date
      DateTime now = DateTime.now();
      // Target date: 2024-11-10T19:00:00.000Z
      DateFormat dateFormat = DateFormat("dd.MM.yyyy");
      DateTime dateTime = dateFormat.parse(date);
      // Calculate the difference in days
      Duration difference = dateTime.difference(now);
      int daysLeft = difference.inDays;
      return daysLeft;
    }
    // Current date
    DateTime now = DateTime.now();
    // Target date: 2024-11-10T19:00:00.000Z
    DateTime targetDate = DateTime.parse(date);
    // Calculate the difference in days
    Duration difference = targetDate.difference(now);
    int daysLeft = difference.inDays;
    return daysLeft;
  }

  static String allPrice(List<GivenAmountModel> takenAmount) {
    int peice = 0;
    for (var element in takenAmount) {
      peice = peice + (int.tryParse(element.amount) ?? 0);
    }
    Log.e(peice);
    return priceFormat(peice);
  }
}
