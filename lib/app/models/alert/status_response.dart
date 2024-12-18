const String statusResponsesTable = 'statusResponses';

class StatusResponse {
  String? status;
  String? checkInAt;
  String? checkOutAt;
  String? userStatus;
  String? shiftStartAt;
  String? shiftEndAt;
  bool? isLate;
  bool? isOnLeave;
  bool? isOnBreak;
  String? breakStartedAt;
  num? travelledDistance;
  String? attendanceType;
  num? trackedHours;
  bool? isSiteEmployee;
  String? siteName;
  String? siteAttendanceType;

  StatusResponse(
      {this.status,
      this.checkInAt,
      this.checkOutAt,
      this.userStatus,
      this.shiftStartAt,
      this.shiftEndAt,
      this.isLate,
      this.isOnLeave,
      this.isOnBreak,
      this.breakStartedAt,
      this.travelledDistance,
      this.trackedHours,
      this.attendanceType,
      this.isSiteEmployee,
      this.siteName,
      this.siteAttendanceType});

  factory StatusResponse.fromJson(Map<String, dynamic> json) => StatusResponse(
        status: json['status'],
        checkInAt: json['checkInAt'],
        checkOutAt: json['checkOutAt'],
        userStatus: json['userStatus'],
        shiftStartAt: json['shiftStartTime'],
        shiftEndAt: json['shiftEndTime'],
        isLate: json['isLate'],
        isOnLeave: json['isOnLeave'],
        isOnBreak: json['isOnBreak'],
        breakStartedAt: json['breakStartedAt'],
        travelledDistance: json['travelledDistance'],
        trackedHours: json['trackedHours'],
        attendanceType: json['attendanceType'],
        isSiteEmployee: json['isSiteEmployee'],
        siteName: json['siteName'],
        siteAttendanceType: json['siteAttendanceType'],
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'checkInAt': checkInAt,
        'checkOutAt': checkOutAt,
        'userStatus': userStatus,
        'shiftStartTime': shiftStartAt,
        'shiftEndTime': shiftEndAt,
        'isLate': isLate,
        'isOnLeave': isOnLeave,
        'isOnBreak': isOnBreak,
        'breakStartedAt': breakStartedAt,
        'travelledDistance': travelledDistance,
        'trackedHours': trackedHours,
        'attendanceType': attendanceType,
        'isSiteEmployee': isSiteEmployee,
        'siteName': siteName,
        'siteAttendanceType': siteAttendanceType,
      };
}
