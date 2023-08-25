class GetAllHistoryResponseModel {
  List<CheckIns>? checkIns;
  List<CheckOuts>? checkOuts;

  GetAllHistoryResponseModel({this.checkIns, this.checkOuts});

  GetAllHistoryResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['checkIns'] != null) {
      checkIns = <CheckIns>[];
      json['checkIns'].forEach((v) {
        checkIns!.add(new CheckIns.fromJson(v));
      });
    }
    if (json['checkOuts'] != null) {
      checkOuts = <CheckOuts>[];
      json['checkOuts'].forEach((v) {
        checkOuts!.add(new CheckOuts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.checkIns != null) {
      data['checkIns'] = this.checkIns!.map((v) => v.toJson()).toList();
    }
    if (this.checkOuts != null) {
      data['checkOuts'] = this.checkOuts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CheckIns {
  String? id;
  String? qR;
  String? vehicleRegNumber;
  bool? checkIn;
  bool? checkout;
  String? checkInTime;
  VehicleType? vehicleType;
  CheckInBy? checkInBy;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CheckIns(
      {this.id,
        this.qR,
        this.vehicleRegNumber,
        this.checkIn,
        this.checkout,
        this.checkInTime,
        this.vehicleType,
        this.checkInBy,
        this.createdAt,
        this.updatedAt,
        this.iV});

  CheckIns.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    qR = json['QR'];
    vehicleRegNumber = json['vehicleRegNumber'];
    checkIn = json['checkIn'];
    checkout = json['checkout'];
    checkInTime = json['checkInTime'];
    vehicleType = json['vehicleType'] != null
        ? new VehicleType.fromJson(json['vehicleType'])
        : null;
    checkInBy = json['checkInBy'] != null
        ? new CheckInBy.fromJson(json['checkInBy'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['QR'] = this.qR;
    data['vehicleRegNumber'] = this.vehicleRegNumber;
    data['checkIn'] = this.checkIn;
    data['checkout'] = this.checkout;
    data['checkInTime'] = this.checkInTime;
    if (this.vehicleType != null) {
      data['vehicleType'] = this.vehicleType!.toJson();
    }
    if (this.checkInBy != null) {
      data['checkInBy'] = this.checkInBy!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class VehicleType {
  String? sId;
  String? name;

  VehicleType({this.sId, this.name});

  VehicleType.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class CheckInBy {
  String? sId;
  String? firstName;
  String? lastName;

  CheckInBy({this.sId, this.firstName, this.lastName});

  CheckInBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}

class CheckOuts {
  String? sId;
  String? qR;
  String? vehicleRegNumber;
  bool? checkIn;
  bool? checkout;
  String? checkInTime;
  String? checkOutTime;
  VehicleType? vehicleType;
  CheckInBy? checkInBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  CheckInBy? checkOutBy;

  CheckOuts(
      {this.sId,
        this.qR,
        this.vehicleRegNumber,
        this.checkIn,
        this.checkout,
        this.checkInTime,
        this.checkOutTime,
        this.vehicleType,
        this.checkInBy,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.checkOutBy});

  CheckOuts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    qR = json['QR'];
    vehicleRegNumber = json['vehicleRegNumber'];
    checkIn = json['checkIn'];
    checkout = json['checkout'];
    checkInTime = json['checkInTime'];
    checkOutTime = json['checkOutTime'];
    vehicleType = json['vehicleType'] != null
        ? new VehicleType.fromJson(json['vehicleType'])
        : null;
    checkInBy = json['checkInBy'] != null
        ? new CheckInBy.fromJson(json['checkInBy'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    checkOutBy = json['checkOutBy'] != null
        ? new CheckInBy.fromJson(json['checkOutBy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['QR'] = this.qR;
    data['vehicleRegNumber'] = this.vehicleRegNumber;
    data['checkIn'] = this.checkIn;
    data['checkout'] = this.checkout;
    data['checkInTime'] = this.checkInTime;
    data['checkOutTime'] = this.checkOutTime;
    if (this.vehicleType != null) {
      data['vehicleType'] = this.vehicleType!.toJson();
    }
    if (this.checkInBy != null) {
      data['checkInBy'] = this.checkInBy!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.checkOutBy != null) {
      data['checkOutBy'] = this.checkOutBy!.toJson();
    }
    return data;
  }
}
