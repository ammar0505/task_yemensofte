class DeliveryBill {
  String? billType;
  String? billNo;
  String? billSrl;
  String? billDate;
  String? billTime;
  String? billAmt;
  String? taxAmt;
  String? dlvryAmt;
  String? mobileNo;
  String? cstmrNm;
  String? rgnNm;
  String? cstmrBuildNo;
  String? cstmrFloorNo;
  String? cstmrAprtmntNo;
  String? cstmrAddrss;
  String? latitude;
  String? longitude;
  String? dlvryStatusFlg;

  DeliveryBill({
    this.billType,
    this.billNo,
    this.billSrl,
    this.billDate,
    this.billTime,
    this.billAmt,
    this.taxAmt,
    this.dlvryAmt,
    this.mobileNo,
    this.cstmrNm,
    this.rgnNm,
    this.cstmrBuildNo,
    this.cstmrFloorNo,
    this.cstmrAprtmntNo,
    this.cstmrAddrss,
    this.latitude,
    this.longitude,
    this.dlvryStatusFlg,
  });

  factory DeliveryBill.fromJson(Map<String, dynamic> json) => DeliveryBill(
        billType: json['BILL_TYPE'] as String?,
        billNo: json['BILL_NO'] as String?,
        billSrl: json['BILL_SRL'] as String?,
        billDate: json['BILL_DATE'] as String?,
        billTime: json['BILL_TIME'] as String?,
        billAmt: json['BILL_AMT'] as String?,
        taxAmt: json['TAX_AMT'] as String?,
        dlvryAmt: json['DLVRY_AMT'] as String?,
        mobileNo: json['MOBILE_NO'] as String?,
        cstmrNm: json['CSTMR_NM'] as String?,
        rgnNm: json['RGN_NM'] as String?,
        cstmrBuildNo: json['CSTMR_BUILD_NO'] as String?,
        cstmrFloorNo: json['CSTMR_FLOOR_NO'] as String?,
        cstmrAprtmntNo: json['CSTMR_APRTMNT_NO'] as String?,
        cstmrAddrss: json['CSTMR_ADDRSS'] as String?,
        latitude: json['LATITUDE'] as String?,
        longitude: json['LONGITUDE'] as String?,
        dlvryStatusFlg: json['DLVRY_STATUS_FLG'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'BILL_TYPE': billType,
        'BILL_NO': billNo,
        'BILL_SRL': billSrl,
        'BILL_DATE': billDate,
        'BILL_TIME': billTime,
        'BILL_AMT': billAmt,
        'TAX_AMT': taxAmt,
        'DLVRY_AMT': dlvryAmt,
        'MOBILE_NO': mobileNo,
        'CSTMR_NM': cstmrNm,
        'RGN_NM': rgnNm,
        'CSTMR_BUILD_NO': cstmrBuildNo,
        'CSTMR_FLOOR_NO': cstmrFloorNo,
        'CSTMR_APRTMNT_NO': cstmrAprtmntNo,
        'CSTMR_ADDRSS': cstmrAddrss,
        'LATITUDE': latitude,
        'LONGITUDE': longitude,
        'DLVRY_STATUS_FLG': dlvryStatusFlg,
      };
}
