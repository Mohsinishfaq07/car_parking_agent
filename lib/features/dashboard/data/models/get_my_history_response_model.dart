class GetMyHistoryResponseModel {
  GetMyHistoryResponseModel({
    required this.checkInHistory,
    required this.checkOutHistory,
  });
  late final List<CheckInHistory> checkInHistory;
  late final List<CheckOutHistory> checkOutHistory;

  GetMyHistoryResponseModel.fromJson(Map<String, dynamic> json){
    checkInHistory = List.from(json['checkInHistory']).map((e)=>CheckInHistory.fromJson(e)).toList();
    checkOutHistory = List.from(json['checkOutHistory']).map((e)=>CheckOutHistory.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['checkInHistory'] = checkInHistory.map((e)=>e.toJson()).toList();
    _data['checkOutHistory'] = checkOutHistory.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class CheckInHistory {
  CheckInHistory({
    required this.id,
    required this.QR,
    required this.vehicleRegNumber,
    required this.checkIn,
    required this.checkout,
    required this.checkInTime,
    required this.checkOutTime,
    required this.vehicleType,
    required this.checkInBy,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
    this.checkOutBy,
  });
  late final String id;
  late final String QR;
  late final String vehicleRegNumber;
  late final bool? checkIn;
  late final bool? checkout;
  late final String checkInTime;
  late final String? checkOutTime;
  late final VehicleType vehicleType;
  late final CheckInBy checkInBy;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  late final CheckOutBy? checkOutBy;

  CheckInHistory.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    QR = json['QR'];
    vehicleRegNumber = json['vehicleRegNumber'];
    checkIn = json['checkIn'];
    checkout = json['checkout'];
    checkInTime = json['checkInTime'];
    checkOutTime = json['checkOutTime'];
    vehicleType = VehicleType.fromJson(json['vehicleType']);
    checkInBy = CheckInBy.fromJson(json['checkInBy']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
    checkOutBy = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['QR'] = QR;
    _data['vehicleRegNumber'] = vehicleRegNumber;
    _data['checkIn'] = checkIn;
    _data['checkout'] = checkout;
    _data['checkInTime'] = checkInTime;
    _data['checkOutTime'] = checkOutTime;
    _data['vehicleType'] = vehicleType.toJson();
    _data['checkInBy'] = checkInBy.toJson();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    _data['checkOutBy'] = checkOutBy;
    return _data;
  }
}

class VehicleType {
  VehicleType({
    required this.id,
    required this.name,
  });
  late final String id;
  late final String name;

  VehicleType.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class CheckInBy {
  CheckInBy({
    required this.id,
    required this.firstName,
    required this.lastName,
  });
  late final String id;
  late final String firstName;
  late final String lastName;

  CheckInBy.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    return _data;
  }
}

class CheckOutBy {
  CheckOutBy({
    required this.id,
    required this.firstName,
    required this.lastName,
  });
  late final String id;
  late final String firstName;
  late final String lastName;

  CheckOutBy.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    return _data;
  }
}

class CheckOutHistory {
  CheckOutHistory({
    required this.id,
    required this.QR,
    required this.vehicleRegNumber,
    required this.checkIn,
    required this.checkout,
    required this.checkInTime,
    required this.checkOutTime,
    required this.vehicleType,
    required this.checkInBy,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
    required this.checkOutBy,
  });
  late final String id;
  late final String QR;
  late final String vehicleRegNumber;
  late final bool checkIn;
  late final bool? checkout;
  late final String? checkInTime;
  late final String? checkOutTime;
  late final VehicleType vehicleType;
  late final CheckInBy checkInBy;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  late final CheckOutBy? checkOutBy;

  CheckOutHistory.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    QR = json['QR'];
    vehicleRegNumber = json['vehicleRegNumber'];
    checkIn = json['checkIn'];
    checkout = json['checkout'];
    checkInTime = json['checkInTime'];
    checkOutTime = json['checkOutTime'];
    vehicleType = VehicleType.fromJson(json['vehicleType']);
    checkInBy = CheckInBy.fromJson(json['checkInBy']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
    checkOutBy = CheckOutBy.fromJson(json['checkOutBy']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['QR'] = QR;
    _data['vehicleRegNumber'] = vehicleRegNumber;
    _data['checkIn'] = checkIn;
    _data['checkout'] = checkout;
    _data['checkInTime'] = checkInTime;
    _data['checkOutTime'] = checkOutTime;
    _data['vehicleType'] = vehicleType.toJson();
    _data['checkInBy'] = checkInBy.toJson();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    _data['checkOutBy'] = checkOutBy!.toJson();
    return _data;
  }
}