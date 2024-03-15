class GetUserCountTimeModel {
  String? workHour;
  String? message;
  String? status;

  GetUserCountTimeModel({this.workHour, this.message, this.status});

  GetUserCountTimeModel.fromJson(Map<String, dynamic> json) {
    workHour = json['work_hour'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['work_hour'] = workHour;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
