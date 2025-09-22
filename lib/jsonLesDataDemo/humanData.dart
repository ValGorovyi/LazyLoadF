import 'package:big_study/jsonLesDataDemo/addressData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'humanData.g.dart';

@JsonSerializable()
class Human {
  String name;
  String surName;
  int age;
  List<Address> address;
  Human({
    required this.name,
    required this.surName,
    required this.age,
    required this.address,
  });
  factory Human.fromJson(Map<String, dynamic> json) => _$HumanFromJson(json);
  // {
  //   return Human(
  //     name: json['name'] as String,
  //     surName: json['surName'] as String,
  //     age: json['age'] as int,
  //     address: (json['address'] as List<dynamic>).map((e) {
  //       return Address.fromJson(e as Map<String, dynamic>);
  //     }).toList(),
  //   );
  // }
  Map<String, dynamic> toJson() => _$HumanToJson(this);
  // {
  //   return {
  //     "name": name,
  //     "surName": surName,
  //     "age": age,
  //     "address": address.map((elem) => elem.toJson()).toList(),
  //   };
  // }
}
