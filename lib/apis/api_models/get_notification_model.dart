class GetNotificationModel {
  String? message;
  List<GetNotificationData>? data;
  String? status;

  GetNotificationModel({this.message, this.data, this.status});

  GetNotificationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <GetNotificationData>[];
      json['data'].forEach((v) {
        data!.add(GetNotificationData.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class GetNotificationData {
  String? notiId;
  String? userId;
  String? type;
  String? message;
  String? date;
  String? dateTime;

  GetNotificationData(
      {this.notiId,
        this.userId,
        this.type,
        this.message,
        this.date,
        this.dateTime});

  GetNotificationData.fromJson(Map<String, dynamic> json) {
    notiId = json['noti_id'];
    userId = json['user_id'];
    type = json['type'];
    message = json['message'];
    date = json['date'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['noti_id'] = notiId;
    data['user_id'] = userId;
    data['type'] = type;
    data['message'] = message;
    data['date'] = date;
    data['date_time'] = dateTime;
    return data;
  }
}
