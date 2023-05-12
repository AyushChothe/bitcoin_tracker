import 'dart:convert';

import 'package:bitcoin_tracker/models/bpi.dart';
import 'package:bitcoin_tracker/models/time.dart';

class BitcoinChart {
  final Time? time;
  final String? disclaimer;
  final String? chartName;
  final Bpi? bpi;

  BitcoinChart({
    this.time,
    this.disclaimer,
    this.chartName,
    this.bpi,
  });

  BitcoinChart copyWith({
    Time? time,
    String? disclaimer,
    String? chartName,
    Bpi? bpi,
  }) =>
      BitcoinChart(
        time: time ?? this.time,
        disclaimer: disclaimer ?? this.disclaimer,
        chartName: chartName ?? this.chartName,
        bpi: bpi ?? this.bpi,
      );

  factory BitcoinChart.fromRawJson(String str) =>
      BitcoinChart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BitcoinChart.fromJson(Map<String, dynamic> json) => BitcoinChart(
        time: json["time"] == null ? null : Time.fromJson(json["time"]),
        disclaimer: json["disclaimer"],
        chartName: json["chartName"],
        bpi: json["bpi"] == null ? null : Bpi.fromJson(json["bpi"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time?.toJson(),
        "disclaimer": disclaimer,
        "chartName": chartName,
        "bpi": bpi?.toJson(),
      };
}
