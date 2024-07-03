class BasicResponseModel {
  int? status;
  String? message;


  BasicResponseModel({this.status, this.message});

  BasicResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;

    return data;
  }
}


class RequestOtpResponse {
  int? status;
  int? otp;
  String? message;


  RequestOtpResponse({this.status, this.message,this.otp});

  RequestOtpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    otp = json['otp'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['otp'] = this.otp;

    return data;
  }
}


