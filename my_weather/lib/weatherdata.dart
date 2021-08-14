class Weatherdata {
  final String city;
  final String description;
  final double temp;
  final int humidity;
  final String country;
  final String icon;

  Weatherdata({
    required this.city,
    required this.description,
    required this.temp,
    required this.country,
    required this.humidity,
    required this.icon,
  });

  factory Weatherdata.fromJSON(Map<String, dynamic> json) {
    return Weatherdata(
      city: json["name"][0],
      description: json["weather"][0]["description"],
      temp: json["main"]["temp"],
      humidity: json["main"]["humidity"],
      country: json["sys"]["country"],
      icon: json["weather"][0]["icon"],
    );
  }
}
