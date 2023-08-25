class LoginResponseModel {
  LoginResponseModel({
    required this.msg,
    required this.data,
  });
  late final String msg;
  late final Data data;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.cnic,
    required this.phone,
    required this.email,
    required this.password,
    required this.gateRole,
    required this.status,
    required this.boothId,
    required this.role,
     // this.otp,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
    // required this.otpExpire,
  });
  late final String id;
  late final String firstName;
  late final String lastName;
  late final String cnic;
  late final String phone;
  late final String email;
  late final String password;
  late final String gateRole;
  late final bool status;
  late final String boothId;
  late final String role;
  // late final String? otp;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    cnic = json['cnic'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    gateRole = json['gateRole'];
    status = json['status'];
    boothId = json['boothId'];
    role = json['role'];
    // otp = json['otp'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
    // otpExpire = json['otpExpire'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['cnic'] = cnic;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['password'] = password;
    _data['gateRole'] = gateRole;
    _data['status'] = status;
    _data['boothId'] = boothId;
    _data['role'] = role;
    // _data['otp'] = otp;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    // _data['otpExpire'] = otpExpire;
    return _data;
  }
}
