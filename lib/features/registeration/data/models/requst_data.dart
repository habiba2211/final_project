class RequestData{
  String firstName;
  String lastName;
  String phoneNumber;
  String nationality;
  String email;
  String password;
  String address;

  RequestData(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.nationality,
      required this.email,
      required this.password,
      required this.address});
  Map<String,dynamic> toJson(){
    return{
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "nationality": nationality,
      "email": email,
      "password": password,
      "address": address
    };
  }
}