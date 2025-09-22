import 'package:json_annotation/json_annotation.dart';

part 'addressData.g.dart';

@JsonSerializable()
class Address {
  final String street;
  final String city;
  final String country;
  final int flat;

  Address({
    required this.country,
    required this.city,
    required this.street,
    required this.flat,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  // {
  // return Address(
  //   street: json['street'] as String,
  //   country: json['country'] as String,
  //   city: json['city'] as String,
  //   flat: json['flat'] as int,
  // );
  // }

  Map<String, dynamic> toJson() => _$AddressToJson(this);
  // {
  //   // return {"city": city, "country": country, "street": street, "flat": flat};
  // }
}


//$ flutter pub run build_runner build