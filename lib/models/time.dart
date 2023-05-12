import 'dart:convert';

class Time {
  final String? updated;
  final DateTime? updatedIso;
  final String? updateduk;

  Time({
    this.updated,
    this.updatedIso,
    this.updateduk,
  });

  Time copyWith({
    String? updated,
    DateTime? updatedIso,
    String? updateduk,
  }) =>
      Time(
        updated: updated ?? this.updated,
        updatedIso: updatedIso ?? this.updatedIso,
        updateduk: updateduk ?? this.updateduk,
      );

  factory Time.fromRawJson(String str) => Time.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        updated: json["updated"],
        updatedIso: json["updatedISO"] == null
            ? null
            : DateTime.parse(json["updatedISO"]),
        updateduk: json["updateduk"],
      );

  Map<String, dynamic> toJson() => {
        "updated": updated,
        "updatedISO": updatedIso?.toIso8601String(),
        "updateduk": updateduk,
      };
}
