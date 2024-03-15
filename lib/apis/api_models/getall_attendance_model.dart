class GetAllAttendanceModel {
  List<GetAllAttendanceResult>? result;
  String? message;
  String? status;

  GetAllAttendanceModel({this.result, this.message, this.status});

  GetAllAttendanceModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetAllAttendanceResult>[];
      json['result'].forEach((v) {
        result!.add(GetAllAttendanceResult.fromJson(v));
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

class GetAllAttendanceResult {
  String? id;
  String? type;
  String? checkType;
  String? userId;
  String? attendenceId;
  String? time;
  String? endTime;
  String? date;
  String? duration;

  GetAllAttendanceResult(
      {this.id,
        this.type,
        this.checkType,
        this.userId,
        this.attendenceId,
        this.time,
        this.endTime,
        this.date,
        this.duration});

  GetAllAttendanceResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    checkType = json['check_type'];
    userId = json['user_id'];
    attendenceId = json['attendence_id'];
    time = json['time'];
    endTime = json['end_time'];
    date = json['date'];
    duration = json['duration'];
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
    data['duration'] = duration;
    return data;
  }
}
