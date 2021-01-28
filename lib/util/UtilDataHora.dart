import 'package:intl/intl.dart';
import 'package:sembast/timestamp.dart';

class UtilDataHora {
  

  static DateTime parseStringToDate(String date, {bool minutos = false}) {
    try {
      return DateTime.parse(date);
    } catch (e) {
      if(date.contains("-"))date = date.replaceAll("-", "");
      try {
        if(minutos){
          return DateFormat('d/M/yyyy HH:mm').parse(date);
        }else{
          return DateFormat('d/M/yyyy').parse(date);
        }
      } catch (e) {
        return null;
      }
    }
  }

  

  static String getDaTaMesDiaAno({int dataMilis, DateTime dateTime, String locale}) {
    try {
      var formatter = new DateFormat.yMd(locale);
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis));
    } catch (e) {
      return "--/--/----";
    }
  }

  static String getMesLocalizado({int dataMilis, DateTime dateTime, String dataString}) {
    try {
      if(dataString != null) dateTime = parseStringToDate(dataString);
      var formatter = new DateFormat('MMM');
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis));
    } catch (e) {
      return "--/--/----";
    }
  }
  static int getWeek(DateTime date){
  int year = date.year;
  DateTime stateDate = DateTime(year,1,1);
  int weekday = stateDate.weekday;
  int days = date.difference(stateDate).inDays; 
  int week = ((weekday+days)/7).ceil();
  return week;
}
  static String getDiaDaSemanaLocalizado({int dataMilis, DateTime dateTime}) {
    try {
      var formatter = new DateFormat('EEEE, dd/MM');
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis));
    } catch (e) {
      return "--/--/----";
    }
  }
  static String getDiaDaSemanaLocalizadoResumido({int dataMilis, DateTime dateTime}) {
    try {
      var formatter = new DateFormat('EE');
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis));
    } catch (e) {
      return "--/--/----";
    }
  }
  static String getDaTaAnoMesDia({int dataMilis, DateTime dateTime}) {
    try {
      var formatter = new DateFormat('yyyy-MM-dd');
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis));
    } catch (e) {
      return "--/--/----";
    }
  }

  static String getDia({int dataMilis, DateTime dateTime}) {
    try {
      var formatter = new DateFormat.d();
      return formatter
          .format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis));
    } catch (e) {
      return "--";
    }
  }
  static String getDiaAbreviacao({int dataMilis, DateTime dateTime}) {
    try {
      var formatter = new DateFormat.E('pt');
      return formatter
          .format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis));
    } catch (e) {
      return "--";
    }
  }
  static Timestamp getTimeStamp(DateTime dateTime){
    return Timestamp.fromDateTime(dateTime);
  }

  static DateTime getDateFromTimeStamp(String dateTime){
      return Timestamp.parse(dateTime).toDateTime();
  }

  static num getWeekOfMonth(DateTime dateTime){
          String date = dateTime.toString();
          String firstDay = date.substring(0, 7) + '01' + date.substring(10);
          int weekDay = DateTime.parse(firstDay).weekday;
          int currentWeek;
          if (weekDay == 7) {
                currentWeek = (DateTime.now().day / 7).ceil();
          }else{
                currentWeek = ( (DateTime.now().day + weekDay) / 7).ceil();
          }
    return currentWeek;
  }

  static String getMes({int dataMilis, DateTime dateTime}) {
    try {
      var formatter = new DateFormat.MMM();
      return formatter
          .format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis));
    } catch (e) {
      return "--";
    }
  }

  static String getDiaMes({int dataMilis, DateTime dateTime}) {
    try {
      var formatter = new DateFormat.MMMd();
      return formatter
          .format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis));
    } catch (e) {
      return "--";
    }
  }

  static String getDiaMesAno({int dataMilis, DateTime dateTime, String dateString}) {
    try {
      if(dateString != null) dateTime = parseStringToDate(dateString);
      var formatter = new DateFormat.yMd('pt');
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis));
    } catch (e) {
      return "00/00/00";
    }
  }


  static List<DateTime> getTodosDiasDaSemana({DateTime time}){
      final firstDayOfWeek = time.subtract(Duration(days: time.weekday - 1));
      return List.generate(7, (index) => index).map((value) => firstDayOfWeek.add(Duration(days: value))).toList();
  }
  static getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  static num getSemanaMesAno(DateTime dateTime){
    return num.parse("${getWeek(dateTime)}${getMesAno(dateTime: dateTime).replaceAll('/', '')}");
  }

    static String getSemanaMesAnoString(DateTime dateTime){
    return "${getMesAno(dateTime: dateTime)} - ${getWeekOfMonth(dateTime)}ª semana";
  }

  static String getMesAno({int dataMilis, DateTime dateTime, String dateString}) {
    try {
      if(dateString != null) dateTime = parseStringToDate(dateString);
      var formatter = new DateFormat.yM('pt');
      return formatter.format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis));
    } catch (e) {
      return "00/0000";
    }
  }

  static String getDiaMesAnoHorasMinutos({int dataMilis, DateTime dateTime, String dateString}) {
    try {
      if(dateString != null) dateTime = parseStringToDate(dateString,minutos: true);
      var formatter = new DateFormat.yMd('pt').add_Hm();
      return formatter
          .format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis));
    } catch (e) {
      return "00/00/00 00:00:00";
    }
  }

  static String getApenasHora({int dataMilis, DateTime dateTime}) {
    try {
      var formatter = new DateFormat.Hm();
      return formatter
          .format(dateTime ?? DateTime.fromMillisecondsSinceEpoch(dataMilis));
    } catch (e) {
      return "--:--";
    }
  }

  static String getApenasMinSecs({Duration duration, num segundos}) {
    try {
      return format(duration ?? Duration(seconds: segundos));
    } catch (e) {
      return "--:--";
    }
  }

  static format(Duration d) =>
      d.toString().split('.').first.replaceFirst("0:", "");
  static DateTime parseNunToDate(num value) =>
      value != null ? DateTime.fromMillisecondsSinceEpoch(value) : null;
  static num parseDateToNum(DateTime date)=>date?.millisecondsSinceEpoch ?? null;
}
