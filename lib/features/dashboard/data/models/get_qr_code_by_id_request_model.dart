// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetQrCodeByIdRequestModel {
  String qrId;
  GetQrCodeByIdRequestModel(this.qrId);
}

class GetQrCodeByIdResponseModel {
  GetQrCodeByIdResponseModel({
    required this.id,
    required this.qrId,
    required this.createdAt,
    required this.updatedAt,
    required this.vehicelNumber,
  });
  late final String id;
  late final String qrId;
  late final String? vehicelNumber;
  late final String createdAt;
  late final String updatedAt;

  GetQrCodeByIdResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    qrId = json['qrId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    vehicelNumber = json['vehicleRegNumber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['qrId'] = qrId;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['vehicelNumber'] = vehicelNumber;
    return _data;
  }
}

class CheckInRequestModel {
  final String qrId;
  final String vehicleRegNumber;
  final String userId;
  final String vehicleType;
  CheckInRequestModel({
    required this.qrId,
    required this.vehicleRegNumber,
    required this.userId,
    required this.vehicleType,
  });

  CheckInRequestModel copyWith({
    String? qrId,
    String? vehicleRegNumber,
    String? userId,
    String? vehicleType,
  }) {
    return CheckInRequestModel(
      qrId: qrId ?? this.qrId,
      vehicleRegNumber: vehicleRegNumber ?? this.vehicleRegNumber,
      userId: userId ?? this.userId,
      vehicleType: vehicleType ?? this.vehicleType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'qrId': qrId,
      'vehicleRegNumber': vehicleRegNumber,
      'userId': userId,
      'vehicleType': vehicleType,
    };
  }

  factory CheckInRequestModel.fromMap(Map<String, dynamic> map) {
    return CheckInRequestModel(
      qrId: map['qrId'] as String,
      vehicleRegNumber: map['vehicleRegNumber'] as String,
      userId: map['userId'] as String,
      vehicleType: map['vehicletype'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckInRequestModel.fromJson(String source) =>
      CheckInRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CheckInRequestModel(qrId: $qrId, vehicleRegNumber: $vehicleRegNumber, userId: $userId, vehicletype: $vehicleType)';
  }

  @override
  bool operator ==(covariant CheckInRequestModel other) {
    if (identical(this, other)) return true;

    return other.qrId == qrId &&
        other.vehicleRegNumber == vehicleRegNumber &&
        other.userId == userId &&
        other.vehicleType == vehicleType;
  }

  @override
  int get hashCode {
    return qrId.hashCode ^
        vehicleRegNumber.hashCode ^
        userId.hashCode ^
        vehicleType.hashCode;
  }
}

class CheckOutRequestModel {
  final String qrId;
  final String userId;
  CheckOutRequestModel({
    required this.qrId,
    required this.userId,
  });

  CheckOutRequestModel copyWith({
    String? qrId,
    String? checkOutBy,
  }) {
    return CheckOutRequestModel(
      qrId: qrId ?? this.qrId,
      userId: checkOutBy ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'qrId': qrId,
      'checkOutBy': userId,
    };
  }

  factory CheckOutRequestModel.fromMap(Map<String, dynamic> map) {
    return CheckOutRequestModel(
      qrId: map['qrId'] as String,
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckOutRequestModel.fromJson(String source) =>
      CheckOutRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CheckOutRequestModel(qrId: $qrId, userId: $userId)';

  @override
  bool operator ==(covariant CheckOutRequestModel other) {
    if (identical(this, other)) return true;

    return other.qrId == qrId && other.userId == userId;
  }

  @override
  int get hashCode => qrId.hashCode ^ userId.hashCode;
}
