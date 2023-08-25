class GenerateQRRequestModel {
  GenerateQRRequestModel({
  required this.vehicleRegNumber,
  required this.vehicleModal,
  required this.vehicleColor,
  required this.vehiclePic,
});
late final String vehicleRegNumber;
late final String vehicleModal;
late final String vehicleColor;
late final String vehiclePic;

GenerateQRRequestModel.fromJson(Map<String, dynamic> json){
vehicleRegNumber = json['vehicleRegNumber'];
vehicleModal = json['vehicleModal'];
vehicleColor = json['vehicleColor'];
vehiclePic = json['vehiclePic'];
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['vehicleRegNumber'] = vehicleRegNumber;
  _data['vehicleModal'] = vehicleModal;
  _data['vehicleColor'] = vehicleColor;
  _data['vehiclePic'] = vehiclePic;
  return _data;
}
}