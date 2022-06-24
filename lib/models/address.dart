class Address {
  final String name, street, locality, subLocality, country, postalCode;

  Address({
    this.name  = '',
    this.street = '',
    this.subLocality = '',
    this.locality = '',
    this.postalCode = '',
    this.country = ' '
});

  factory Address.fromJson(var json){
    return Address(
      name: json['name'],
      street: json['street'],
      subLocality: json['subLocality'],
      locality: json['locality'],
      postalCode: json['postalCode'],
      country: json['country']
    );
  }
}