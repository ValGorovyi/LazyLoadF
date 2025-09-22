// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'humanData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Human _$HumanFromJson(Map<String, dynamic> json) => Human(
  name: json['name'] as String,
  surName: json['surName'] as String,
  age: (json['age'] as num).toInt(),
  address: (json['address'] as List<dynamic>)
      .map((e) => Address.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HumanToJson(Human instance) => <String, dynamic>{
  'name': instance.name,
  'surName': instance.surName,
  'age': instance.age,
  'address': instance.address,
};
