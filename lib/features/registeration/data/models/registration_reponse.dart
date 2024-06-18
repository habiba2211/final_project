class RegistrationResponse {
  String? userName;
  String? email;
  String? token;

  RegistrationResponse({this.userName, this.email, this.token});

  RegistrationResponse.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['email'] = email;
    data['token'] = token;
    return data;
  }
}
