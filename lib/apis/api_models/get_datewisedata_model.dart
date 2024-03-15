class GetDateWiseDataModel {
  List<GetDateWiseDataResult>? result;
  String? message;
  String? status;

  GetDateWiseDataModel({this.result, this.message, this.status});

  GetDateWiseDataModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetDateWiseDataResult>[];
      json['result'].forEach((v) {
        result!.add(GetDateWiseDataResult.fromJson(v));
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

class GetDateWiseDataResult {
  String? id;
  String? type;
  String? checkType;
  String? userId;
  String? attendenceId;
  String? time;
  String? endTime;
  String? date;

  GetDateWiseDataResult(
      {this.id,
        this.type,
        this.checkType,
        this.userId,
        this.attendenceId,
        this.time,
        this.endTime,
        this.date});

  GetDateWiseDataResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    checkType = json['check_type'];
    userId = json['user_id'];
    attendenceId = json['attendence_id'];
    time = json['time'];
    endTime = json['end_time'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['check_type'] = checkType;
    data['user_id'] = userId;
    data['attendence_id'] = attendenceId;
    data['time'] = time;
    data['end_time'] = endTime;
    data['date'] = date;
    return data;
  }
}
