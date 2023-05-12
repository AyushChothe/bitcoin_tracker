import 'dart:convert';

import 'package:bitcoin_tracker/models/currency.dart';

class Bpi {
  final Currency? usd;
  final Currency? gbp;
  final Currency? eur;

  Bpi({
    this.usd,
    this.gbp,
    this.eur,
  });

  Bpi copyWith({
    Currency? usd,
    Currency? gbp,
    Currency? eur,
  }) =>
      Bpi(
        usd: usd ?? this.usd,
        gbp: gbp ?? this.gbp,
        eur: eur ?? this.eur,
      );

  factory Bpi.fromRawJson(String str) => Bpi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bpi.fromJson(Map<String, dynamic> json) => Bpi(
        usd: json["USD"] == null ? null : Currency.fromJson(json["USD"]),
        gbp: json["GBP"] == null ? null : Currency.fromJson(json["GBP"]),
        eur: json["EUR"] == null ? null : Currency.fromJson(json["EUR"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd?.toJson(),
        "GBP": gbp?.toJson(),
        "EUR": eur?.toJson(),
      };
}
