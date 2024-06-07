enum Status { INITIAL, LOADING, COMPLETED, ERROR }

class Helper{
  String kelvinToCelcius(String? temperature){
    double celsius = double.parse(temperature!) - 273.15;
    return celsius.toStringAsFixed(1);
  }

  String unixTimeToAmPm(String? unixTime) {
    // Convert Unix time (seconds since epoch) to DateTime
    DateTime date = DateTime.fromMillisecondsSinceEpoch(int.parse(unixTime!) * 1000);
    // Extract hour and minute
    int hour = date.hour;
    int minute = date.minute;
    // Determine AM/PM
    String period = hour >= 12 ? "PM" : "AM";
    // Convert hour from 24-hour to 12-hour format
    hour = hour % 12;
    hour = hour == 0 ? 12 : hour; // Adjust for midnight and noon
    // Format minute with leading zero if necessary
    String minuteStr = minute < 10 ? '0$minute' : minute.toString();
    return "$hour:$minuteStr $period";
  }
}