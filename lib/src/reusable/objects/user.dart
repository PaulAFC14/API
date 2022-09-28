class User {
  late String name;
  late String lastname;
  late String email;
  late String phone;
  late String token;

  User(
      {required this.name,
      required this.lastname,
      required this.email,
      required this.phone,
      required this.token});

  setName(String name) {
    this.name = name;
  }

  String getName() {
    return name;
  }

  setLastname(String lastname) {
    this.lastname = lastname;
  }

  String getLastname() {
    return lastname;
  }

  setEmail(String email) {
    this.email = email;
  }

  String getEmail() {
    return email;
  }

  setPhone(String phone) {
    this.phone = phone;
  }

  String getPhone() {
    return phone;
  }

  String getToken() {
    return token;
  }
}
