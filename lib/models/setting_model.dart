class SettingModel {
  String? status;
  String? message;
  Data? data;

  SettingModel({this.status, this.message, this.data});

  SettingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? version;
  String? phone;
  String? baseUrl;
  String? updateTime;


  Data({
    this.id,
    this.version,
    this.phone,
    this.baseUrl,
    this.updateTime,

  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    version = json['version'];
    phone = json['phone'];
    baseUrl = json['baseUrl'];
    updateTime= json["update_time"];

  }
}

