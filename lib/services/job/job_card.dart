import 'package:flutter_guid/flutter_guid.dart';
import 'package:sqflite/sqflite.dart';
import 'package:on_cloc_mobile/app/models/job/job_card.dart';
import 'package:on_cloc_mobile/services/db/database_service.dart';

class JobCardService {
  static Future<Database> getOnClocDatabase() async {
    return await OnClocDbService().database;
  }

  static Future<List<JobCard>?> getJobCards() async {
    final response =
        await getOnClocDatabase().then((db) => db.query(jobCardsTable));
    return response.map((json) => JobCard.fromJson(json)).toList();
  }

  static Future<void> createJobCard(JobCard jobCard) async {
    final db = await getOnClocDatabase();
    await db.insert(jobCardsTable, jobCard.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> updateJobCard(JobCard jobCard) async {
    final db = await getOnClocDatabase();
    await db.update(jobCardsTable, jobCard.toJson(),
        where: '${JobCardFields.jobCardId} = ?',
        whereArgs: [jobCard.jobCardId],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> deleteJobCard(Guid jobCardId) async {
    final db = await getOnClocDatabase();
    await db.delete(jobCardsTable,
        where: '${JobCardFields.jobCardId} = ?', whereArgs: [jobCardId]);
  }

  static Future<JobCard> getJobCardByJobCardId(Guid jobCardId) async {
    final response = await getOnClocDatabase().then((db) => db.query(
        jobCardsTable,
        where: '${JobCardFields.jobCardId} = ?',
        whereArgs: [jobCardId]));
    return JobCard.fromJson(response.first);
  }

  static Future<JobCard> getJobCardByServiceTicketId(
      Guid serviceTicketId) async {
    final response = await getOnClocDatabase().then((db) => db.query(
        jobCardsTable,
        where: '${JobCardFields.serviceTicketId} = ?',
        whereArgs: [serviceTicketId]));
    return JobCard.fromJson(response.first);
  }

  static Future<JobCard> getJobCardByServiceDeskId(Guid serviceDeskId) async {
    final response = await getOnClocDatabase().then((db) => db.query(
        jobCardsTable,
        where: '${JobCardFields.serviceDeskId} = ?',
        whereArgs: [serviceDeskId]));
    return JobCard.fromJson(response.first);
  }

  static Future<JobCard> getAssignedJobCardsByProfileId(
      Guid userProfileId) async {
    final response = await getOnClocDatabase().then((db) => db.query(
        jobCardsTable,
        where:
            '${JobCardFields.userProfileId} = ? && ${JobCardFields.isAssigned} = true',
        whereArgs: [userProfileId]));
    return JobCard.fromJson(response.first);
  }

  static Future<List<JobCard>> getPastJobCardsByProfileId(Guid userProfileId) async {
    final response = await getOnClocDatabase().then((db) => db.query(
        jobCardsTable,
        where: '${JobCardFields.userProfileId} = ? && ${JobCardFields.isClosed} = true',
        whereArgs: [userProfileId]));
    return response.map((json) => JobCard.fromJson(json)).toList();
  }

  static Future<List<JobCard>> getOpenJobCardsByProfileId(Guid userProfileId) async {
    final response = await getOnClocDatabase().then((db) => db.query(
        jobCardsTable,
        where: '${JobCardFields.userProfileId} = ? && ${JobCardFields.isClosed} = false',
        whereArgs: [userProfileId]));
    return response.map((json) => JobCard.fromJson(json)).toList();
  }

  static Future<JobCard> getJobCardByJobNumber(String jobNumber) async {
    final response = await getOnClocDatabase().then((db) => db.query(
        jobCardsTable,
        where: '${JobCardFields.jobNumber} = ?',
        whereArgs: [jobNumber]));
    return JobCard.fromJson(response.first);
  }

  static List<JobCard> getSeedJobCards() {
    return [
      JobCard(
          jobCardId: Guid.newGuid,
          serviceTicketId: Guid.newGuid,
          serviceDeskId: Guid.newGuid,
          userProfileId: Guid('d1b3b3b3-3b3b-3b3b-3b3b-3b3b3b3b3b3b'),
          isAssigned: true,
          isClosed: false,
          isPrimaryTechnician: true,
          jobStatusId: 1,
          jobPriorityId: 1,
          jobTypeId: 1,
          jobCategoryId: 1,
          jobClassId: 1,
          jobGroupId: 1,
          jobGenreId: 1,
          jobNumber: 'JOB0001',
          jobSubject: 'Vehicle Inspection',
          jobDescription: 'Check the vehicle for any mechanical issues',
          jobLocation: 'Ntinda Stretcher, Kampala',
          assignOnDate: DateTime.parse('2024-12-01'),
          scheduledDate: DateTime.parse('2024-12-07'),
          createdAt: DateTime.now()),
      JobCard(
          jobCardId: Guid.newGuid,
          serviceTicketId: Guid.newGuid,
          serviceDeskId: Guid.newGuid,
          userProfileId: Guid('d1b3b3b3-3b3b-3b3b-3b3b-3b3b3b3b3b3b'),
          isAssigned: true,
          isClosed: false,
          isPrimaryTechnician: false,
          jobStatusId: 2,
          jobPriorityId: 2,
          jobTypeId: 2,
          jobCategoryId: 2,
          jobClassId: 2,
          jobGroupId: 2,
          jobGenreId: 2,
          jobNumber: 'JOB0022',
          jobSubject: 'Tractor Service',
          jobDescription: 'Complete service of the tractor engine',
          jobLocation: 'Port bell Road,Kampala',
          assignOnDate: DateTime.parse('2024-12-05'),
          scheduledDate: DateTime.parse('2024-12-12'),
          createdAt: DateTime.now()),
      JobCard(
          jobCardId: Guid.newGuid,
          serviceTicketId: Guid.newGuid,
          serviceDeskId: Guid.newGuid,
          userProfileId: Guid('d1b3b3b3-3b3b-3b3b-3b3b-3b3b3b3b3b3b'),
          isAssigned: true,
          isClosed: false,
          isPrimaryTechnician: true,
          jobStatusId: 3,
          jobPriorityId: 3,
          jobTypeId: 3,
          jobCategoryId: 3,
          jobClassId: 3,
          jobGroupId: 3,
          jobGenreId: 3,
          jobNumber: 'JOB1003',
          jobSubject: 'Parts Replacement',
          jobDescription: 'Replace all the worn out parts of the vehicle',
          jobLocation: 'Kololo, Kampala',
          assignOnDate: DateTime.parse('2024-12-10'),
          scheduledDate: DateTime.parse('2024-12-17'),
          createdAt: DateTime.now()),
    ];
  }
}
