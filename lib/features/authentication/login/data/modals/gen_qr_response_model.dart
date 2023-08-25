class GenerateQRResponseModel {
  GenerateQRResponseModel({
    required this.qrId,
    required this.vehicleRegNumber,
    required this.vehicleModal,
    required this.vehicleColor,
    required this.vehiclePic,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String qrId;
  late final String? vehicleRegNumber;
  late final String? vehicleModal;
  late final String? vehicleColor;
  late final String? vehiclePic;
  late final String id;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  GenerateQRResponseModel.fromJson(Map<String, dynamic> json){
    qrId = json['qrId'];
    vehicleRegNumber = json['vehicleRegNumber'];
    vehicleModal = json['vehicleModal'];
    vehicleColor = json['vehicleColor'];
    vehiclePic = json['vehiclePic']==null?'':json['vehiclePic'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['qrId'] = qrId;
    _data['vehicleRegNumber'] = vehicleRegNumber;
    _data['vehicleModal'] = vehicleModal;
    _data['vehicleColor'] = vehicleColor;
    _data['vehiclePic'] = vehiclePic;
    _data['_id'] = id;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}