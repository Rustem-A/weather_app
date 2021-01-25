class Weather {
  String city;
  Map<String, dynamic> current;
  DateTime lastUpdate;
  Map<String, dynamic> tommorow;
  String tommorowDesc;
  String todayDesc;
  var tomDate;
  var daily;

  Weather({
    this.city,
    this.current,
    this.lastUpdate,
    this.tommorow,
    this.tommorowDesc,
    this.tomDate,
    this.todayDesc,
    this.daily,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['timezone'].substring(json['timezone'].indexOf('/') + 1),
      current: json['current'],
      lastUpdate: new DateTime.fromMillisecondsSinceEpoch(
        json['current']['dt'] * 1000,
        isUtc: false,
      ),
      todayDesc: json['current']['weather'][0]['main'],
      tommorow: json['daily'][1],
      tommorowDesc: json['daily'][1]['weather'][0]['main'],
      tomDate: new DateTime.fromMillisecondsSinceEpoch(
        json['daily'][1]['dt'] * 1000,
        isUtc: false,
      ),
      daily: json['daily'],
    );
  }
}
