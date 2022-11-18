import 'package:duration_iso_parser/duration_iso_parser.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Model {
  final String videoId;
  final String urlImage;
  final String title;
  final String channelTitle;
  @JsonKey(fromJson: viewCountSetting)
  final String viewCount;
  @JsonKey(fromJson: formatDuration)
  final String duration;
  @JsonKey(fromJson: timePublished)
  final String dataTime;

  Model({
    required this.videoId,
    required this.urlImage,
    required this.title,
    required this.channelTitle,
    required this.viewCount,
    required this.duration,
    required this.dataTime,
  });

  //Чтобы настроить время продолжения фильма
    static String formatDuration(String duration) {
    final parser = DurationParser().parse(duration);
    var seconds = parser.inSeconds;
    /*знак "~/" Разделить, возвращая целочисленный результат*/
    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('${days}');
    }
    if (tokens.isNotEmpty || hours != 0) {
      tokens.add('${hours}');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add('${minutes}');
    }
    tokens.add('${seconds}');

    return tokens.join(':');
  }
   //Чтобы определить количество просмотров в буквах
 static String viewCountSetting(String countString) {
    int count = int.parse(countString);
    int viewCount;
    String number;
    if (count <= 999) {
      viewCount = count;
      number = '';
    } else if (count >= 1000 && count < 1000000) {
      viewCount = count ~/ 1000;
      number = 'тыс.';
    } else if (count >= 1000000) {
      double million = count / 1000000;
      var withRemainder = num.parse(million.toStringAsFixed(1));
      number = 'млн';
      return withRemainder.toString() + number;
    } else {
      viewCount = 0;
      number = '';
    }
    return viewCount.toString() + number;
  }

  static String timePublished(String dataTime) {
    final parser = DateTime.parse(dataTime);
    final now = DateTime.now();
    final difference = parser.difference(now);
    final days = -difference.inDays;
    final hours = -difference.inHours;
    int month = 0, year = 0;
    String timePublish;
    if (days == 0) {
      timePublish = hours.toString() + hourSuffix(hours);
    } else if (days >= 30) {
      month = days ~/ 30;
      timePublish = month.toString() + monthSuffix(month);
    } else if (month >= 12) {
      year = month ~/ 12;
      timePublish = year.toString() + yearSuffix(year);
    } else {
      timePublish = days.toString() + daySuffix(days);
    }

    return timePublish;
  }

  //Чтобы определить окончания слов 'час'
  static String hourSuffix(int time) {
    if (time == 1) {
      return ' час назад';
    } else if (time >= -2 && time <= -4) {
      return ' часа назад';
    } else {
      return ' часов назад';
    }
  }

//Чтобы определить окончания слов 'день'
  static String daySuffix(int time) {
    if (time == 1) {
      return ' день назад';
    } else if (time >= 2 && time <= 4) {
      return ' дня назад';
    } else {
      return ' дней назад';
    }
  }

  //Чтобы определить окончания слов 'месяц'
  static String monthSuffix(int time) {
    if (time == 1) {
      return ' месяц назад';
    } else if (time >= 2 && time <= 4) {
      return ' месяца назад';
    } else {
      return ' месяцев назад';
    }
  }

  //Чтобы определить окончания слов 'год'
  static String yearSuffix(int time) {
    if (time == 1) {
      return ' год назад';
    } else if (time >= 2 && time <= 4) {
      return ' года назад';
    } else {
      return ' лет назад';
    }
  }

  

  factory Model.fromJson(Map<String, dynamic> json) {
    return _$ModelFromJson(json);
  }
}
