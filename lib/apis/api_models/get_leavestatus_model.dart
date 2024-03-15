class GetLeaveStatusModel {
  List<GetLeaveStatusResult>? result;
  String? message;
  String? status;

  GetLeaveStatusModel({this.result, this.message, this.status});

  GetLeaveStatusModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetLeaveStatusResult>[];
      json['result'].forEach((v) {
        result!.add(GetLeaveStatusResult.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetLeaveStatusResult {
  String? liId;
  String? userId;
  String? leaveFromDate;
  String? leaveToDate;
  String? reason;
  String? adminReply;
  String? status;
  String? dateTime;

  GetLeaveStatusResult(
      {this.liId,
        this.userId,
        this.leaveFromDate,
        this.leaveToDate,
        this.reason,
        this.adminReply,
        this.status,
        this.dateTime});

  GetLeaveStatusResult.fromJson(Map<String, dynamic> json) {
    liId = json['li_id'];
    userId = json['user_id'];
    leaveFromDate = json['leave_from_date'];
    leaveToDate = json['leave_to_date'];
    reason = json['reason'];
    adminReply = json['admin_reply'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['li_id'] = liId;
    data['user_id'] = userId;
    data['leave_from_date'] = leaveFromDate;
    data['leave_to_date'] = leaveToDate;
    data['reason'] = reason;
    data['admin_reply'] = adminReply;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
