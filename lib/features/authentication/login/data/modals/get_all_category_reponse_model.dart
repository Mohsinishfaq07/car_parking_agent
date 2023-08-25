

class GetAllCategoryResponseModel {
  GetAllCategoryResponseModel({
    required this.data,
  });
  late final List<Data> data;

  GetAllCategoryResponseModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.icon,
  });
  late final String id;
  late final String name;
  late final String icon;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['icon'] = icon;
    return _data;
  }
}