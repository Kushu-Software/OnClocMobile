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
    jobStatusId,
    jobPriorityId,
    jobTypeId,
    jobCategoryId,
    jobClassId,
    jobGroupId,
    jobGenreId,
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
  static const String jobStatusId = 'jobStatusId';
  static const String jobPriorityId = 'jobPriorityId';
  static const String jobTypeId = 'jobTypeId';
  static const String jobCategoryId = 'jobCategoryId';
  static const String jobClassId = 'jobClassId';
  static const String jobGroupId = 'jobGroupId';
  static const String jobGenreId = 'jobGenreId';
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
  final int jobStatusId;
  final int jobPriorityId;
  final int jobTypeId;
  final int jobCategoryId;
  final int jobClassId;
  final int jobGroupId;
  final int jobGenreId;
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
    required this.jobStatusId,
    required this.jobPriorityId,
    required this.jobTypeId,
    required this.jobCategoryId,
    required this.jobClassId,
    required this.jobGroupId,
    required this.jobGenreId,
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
        jobStatusId: json['jobStatusId'],
        jobPriorityId: json['jobPriorityId'],
        jobTypeId: json['jobTypeId'],
        jobCategoryId: json['jobCategoryId'],
        jobClassId: json['jobClassId'],
        jobGroupId: json['jobGroupId'],
        jobGenreId: json['jobGenreId'],
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
        'jobStatusId': jobStatusId,
        'jobPriorityLevelId': jobPriorityId,
        'jobTypeId': jobTypeId,
        'jobCategoryId': jobCategoryId,
        'jobClassId': jobClassId,
        'jobGroupId': jobGroupId,
        'jobGenreId': jobGenreId,
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
