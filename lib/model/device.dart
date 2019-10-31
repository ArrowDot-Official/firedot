class Device {

  String name;
  String status;
  String lat;
  String lng;
  String phone1;
  String phone2;
  String address;

  Device(this.name, this.status, this.lat, this.lng, this.phone1, this.phone2, this.address);

  Device._();

  factory Device.fromJson(Map<String, dynamic> map) {
    return Device._()
        ..name = map['name']
        ..status = map['status']
        ..lat = map['lat']
        ..lng = map['long']
        ..phone1 = map['phone1']
        ..phone2 = map['phone2']
        ..address = map['address'];
  }

  static Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map['name'] = Device._()..name;
    map['status'] = Device._()..status;
    map['lat'] = Device._()..lat;
    map['long'] = Device._()..lng;
    map['phone1'] = Device._()..phone1;
    map['phone2'] = Device._()..phone2;
    map['address'] = Device._()..address;
    return map;
  }

}