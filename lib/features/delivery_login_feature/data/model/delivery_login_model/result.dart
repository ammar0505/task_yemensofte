class Result {
  int? errNo;
  String? errMsg;

  Result({this.errNo, this.errMsg});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        errNo: json['ErrNo'] as int?,
        errMsg: json['ErrMsg'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'ErrNo': errNo,
        'ErrMsg': errMsg,
      };
}
