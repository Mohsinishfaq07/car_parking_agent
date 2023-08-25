class SignUpRequestModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  SignUpRequestModel(
      {this.firstName, this.lastName, this.email, this.password});

  SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
