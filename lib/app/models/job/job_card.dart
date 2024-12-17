import 'package:flutter_guid/flutter_guid.dart';

const String jobCardsTable = 'job_cards';

class JobCardFields {
  static final List<String> values = [
    jobCardId,
    serviceTicketId,
    serviceDeskId,
    userProfileId,
    isAssigned,
    isClosed,
    isPrimaryTechnician,
    jobCardStatusId,
    jobCardPriorityLevelId,
    jobCardTypeId,
    jobCardCategoryId,
    jobCardClassId,
    jobCardGroupId,
    jobCardGenreId,
    jobNumber,
    jobSubject,
    jobDescription,
    jobLocation,
    assignOnDate,
    scheduledDate,
    startDate,
    endDate,
    createdAt,
  ];

  static const String jobCardId = 'jobCardId';
  static const String serviceTicketId = 'serviceTicketId';
  static const String serviceDeskId = 'serviceDeskId';
  static const String userProfileId = 'userProfileId';
  static const String isAssigned = 'isAssigned';
  static const String isClosed = 'isClosed';
  static const String isPrimaryTechnician = 'isPrimaryTechnician';
  static const String jobCardStatusId = 'jobCardStatusId';
  static const String jobCardPriorityLevelId = 'jobCardPriorityLevelId';
  static const String jobCardTypeId = 'jobCardTypeId';
  static const String jobCardCategoryId = 'jobCardCategoryId';
  static const String jobCardClassId = 'jobCardClassId';
  static const String jobCardGroupId = 'jobCardGroupId';
  static const String jobCardGenreId = 'jobCardGenreId';
  static const String jobNumber = 'jobNumber';
  static const String jobSubject = 'jobSubject';
  static const String jobDescription = 'jobDescription';
  static const String jobLocation = 'jobLocation';
  static const String assignOnDate = 'assignOnDate';
  static const String scheduledDate = 'scheduledDate';
  static const String startDate = 'startDate';
  static const String endDate = 'endDate';
  static const String createdAt = 'createdAt';
}

class JobCard {
  final Guid jobCardId;
  final Guid serviceTicketId;
  final Guid serviceDeskId;
  final Guid userProfileId;
  final bool isAssigned;
  final bool isClosed;
  final bool isPrimaryTechnician;
  final int jobCardStatusId;
  final int jobCardPriorityLevelId;
  final int jobCardTypeId;
  final int jobCardCategoryId;
  final int jobCardClassId;
  final int jobCardGroupId;
  final int jobCardGenreId;
  final String jobNumber;
  final String jobSubject;
  final String jobDescription;
  final String jobLocation;
  final DateTime assignOnDate;
  final DateTime scheduledDate;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? createdAt;

  const JobCard({
    required this.jobCardId,
    required this.serviceTicketId,
    required this.serviceDeskId,
    required this.userProfileId,
    required this.isAssigned,
    required this.isClosed,
    required this.isPrimaryTechnician,
    required this.jobCardStatusId,
    required this.jobCardPriorityLevelId,
    required this.jobCardTypeId,
    required this.jobCardCategoryId,
    required this.jobCardClassId,
    required this.jobCardGroupId,
    required this.jobCardGenreId,
    required this.jobNumber,
    required this.jobSubject,
    required this.jobDescription,
    required this.jobLocation,
    required this.assignOnDate,
    required this.scheduledDate,
    this.startDate,
    this.endDate,
    this.createdAt,
  });

  factory JobCard.fromJson(Map<String, dynamic> json) => JobCard(
        jobCardId: json['jobCardId'],
        serviceTicketId: json['serviceTicketId'],
        serviceDeskId: json['serviceDeskId'],
        userProfileId: json['userProfileId'],
        isAssigned: json['isAssigned'],
        isClosed: json['isClosed'],
        isPrimaryTechnician: json['isPrimaryTechnician'],
        jobCardStatusId: json['jobCardStatusId'],
        jobCardPriorityLevelId: json['jobCardPriorityLevelId'],
        jobCardTypeId: json['jobCardTypeId'],
        jobCardCategoryId: json['jobCardCategoryId'],
        jobCardClassId: json['jobCardClassId'],
        jobCardGroupId: json['jobCardGroupId'],
        jobCardGenreId: json['jobCardGenreId'],
        jobNumber: json['jobNumber'],
        jobSubject: json['jobSubject'],
        jobDescription: json['jobDescription'],
        jobLocation: json['jobLocation'],
        assignOnDate: json['assignOnDate'],
        scheduledDate: json['scheduledDate'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        createdAt: json['createdAt'],
      );

  Map<String, dynamic> toJson() => {
        'jobCardId': jobCardId,
        'serviceTicketId': serviceTicketId,
        'serviceDeskId': serviceDeskId,
        'userProfileId': userProfileId,
        'isAssigned': isAssigned,
        'isClosed': isClosed,
        'isPrimaryTechnician': isPrimaryTechnician,
        'jobCardStatusId': jobCardStatusId,
        'jobCardPriorityLevelId': jobCardPriorityLevelId,
        'jobCardTypeId': jobCardTypeId,
        'jobCardCategoryId': jobCardCategoryId,
        'jobCardClassId': jobCardClassId,
        'jobCardGroupId': jobCardGroupId,
        'jobCardGenreId': jobCardGenreId,
        'jobNumber': jobNumber,
        'jobSubject': jobSubject,
        'jobDescription': jobDescription,
        'jobLocation': jobLocation,
        'assignOnDate': assignOnDate,
        'scheduledDate': scheduledDate,
        'startDate': startDate,
        'endDate': endDate,
        'createdAt': createdAt,
      };
}
