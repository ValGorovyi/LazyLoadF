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

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      flat: json['flat'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {"city": city, "country": country, "street": street, "flat": flat};
  }
}
