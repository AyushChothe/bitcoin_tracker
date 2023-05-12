import 'dart:convert';

class Currency {
  final String? code;
  final String? symbol;
  final String? rate;
  final String? description;
  final double? rateFloat;

  Currency({
    this.code,
    this.symbol,
    this.rate,
    this.description,
    this.rateFloat,
  });

  Currency copyWith({
    String? code,
    String? symbol,
    String? rate,
    String? description,
    double? rateFloat,
  }) =>
      Currency(
        code: code ?? this.code,
        symbol: symbol ?? this.symbol,
        rate: rate ?? this.rate,
        description: description ?? this.description,
        rateFloat: rateFloat ?? this.rateFloat,
      );

  factory Currency.fromRawJson(String str) =>
      Currency.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        symbol: json["symbol"],
        rate: json["rate"],
        description: json["description"],
        rateFloat: json["rate_float"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "symbol": symbol,
        "rate": rate,
        "description": description,
        "rate_float": rateFloat,
      };
}
