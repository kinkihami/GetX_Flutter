import 'dart:convert';
import 'dart:developer';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

// String ResponseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  String msg;

  ResponseModel({
    required this.msg,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    log(json['message']);
    return ResponseModel(
      msg: json["message"],
    );
  }

  // Map<String, dynamic> toJson() => {
  //       "msg": msg,
  //       "email": email,
  //       "password": password,
  //     };
}
