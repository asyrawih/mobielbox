class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;

  User(this.id, this.firstName, this.lastName, this.phone, this.email);

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
      firstName = json["first_name"],
      lastName = json["last_name"],
      phone = json["phone"],
      email = json["email"];
}