class User {
  final String gender;
  final String name;
  final String location;
  final String email;

  User(this.gender, this.name, this.location, this.email);

  User.fromJson(Map<String, dynamic> json)
      : gender = json["gender"],
        name = json["name"],
        location = json["location"],
        email = json["email"];
}
