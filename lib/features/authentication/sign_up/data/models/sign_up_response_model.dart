class SignUpResponseModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SignUpResponseModel(
      {this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
