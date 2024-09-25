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

  static int daysLeft(String date) {
    // Current date
    DateTime now = DateTime.now();
    // Target date: 2024-11-10T19:00:00.000Z
    DateTime targetDate = DateTime.parse(date);
    // Calculate the difference in days
    Duration difference = targetDate.difference(now);
    int daysLeft = difference.inDays;
    return daysLeft;
  }
}
