
class User {
  final String name;
  final String email;
  final String street;
  final String city;
  final String phone;
  final String website;
  final String company;

  User({
    required this.name,
    required this.email,
    required this.street,
    required this.city,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      street: json['address']['street'],
      city: json['address']['city'],
      phone: json['phone'],
      website: json['website'],
      company: json['company']['name'],
    );
  }
}