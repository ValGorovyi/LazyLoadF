// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addressData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
  country: json['country'] as String,
  city: json['city'] as String,
  street: json['street'] as String,
  flat: (json['flat'] as num).toInt(),
);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'street': instance.street,
  'city': instance.city,
  'country': instance.country,
  'flat': instance.flat,
};
