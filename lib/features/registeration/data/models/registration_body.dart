class RegistrationBody {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? nationality;
  String? email;
  String? password;
  String? address;

  RegistrationBody(
      {this.firstName,
        this.lastName,
        this.phoneNumber,
        this.nationality,
        this.email,
        this.password,
        this.address});

  RegistrationBody.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    nationality = json['nationality'];
    email = json['email'];
    password = json['password'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['nationality'] = nationality;
    data['email'] = email;
    data['password'] = password;
    data['address'] = address;
    return data;
  }
}
