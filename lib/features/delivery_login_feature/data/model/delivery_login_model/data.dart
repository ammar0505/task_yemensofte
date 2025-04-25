class Data {
  String? deliveryName;

  Data({this.deliveryName});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        deliveryName: json['DeliveryName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'DeliveryName': deliveryName,
      };
}
