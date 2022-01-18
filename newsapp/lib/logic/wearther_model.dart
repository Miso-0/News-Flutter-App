// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<Weather> weatherFromJson(String str) =>
    List<Weather>.from(json.decode(str).map((x) => Weather.fromJson(x)));

String weatherToJson(List<Weather> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Weather {
  Weather({
    this.name,
    this.placeId,
    this.admArea1,
    this.admArea2,
    this.country,
    this.lat,
    this.lon,
    this.timezone,
  });

  String? name;
  String? placeId;
  String? admArea1;
  String? admArea2;
  String? country;
  String? lat;
  String? lon;
  String? timezone;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        name: json["name"],
        placeId: json["place_id"],
        admArea1: json["adm_area1"],
        admArea2: json["adm_area2"] == null ? null : json["adm_area2"],
        country: json["country"],
        lat: json["lat"],
        lon: json["lon"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "place_id": placeId,
        "adm_area1": admArea1,
        "adm_area2": admArea2 == null ? null : admArea2,
        "country": country,
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
      };
}
