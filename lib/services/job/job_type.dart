import 'dart:async';

import 'package:on_cloc_mobile/services/db/database_service.dart';
import 'package:on_cloc_mobile/app/models/job/job_type.dart';
import 'package:sqflite/sqflite.dart';

class JobTypeService {
  Future<Database> getOnClocDatabase() async {
    return await OnClocDbService().database;
  }

  Future<List<JobType>?> getJobTypes() async {
    final response =
        await getOnClocDatabase().then((db) => db.query(jobTypesTable));
    return response.isNotEmpty
        ? response.map((e) => JobType.fromJson(e)).toList()
        : [];
  }

  Future<JobType> getJobTypeById(int jobTypeId) async {
    final response = await getOnClocDatabase().then((db) => db.query(
        jobTypesTable,
        where: '${JobTypeFields.jobTypeId} = ?',
        whereArgs: [jobTypeId]));
    return JobType.fromJson(response.first);
  }

  Future<void> createJobType(JobType jobType) async {
    final db = await getOnClocDatabase();
    await db.insert(jobTypesTable, jobType.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateJobType(JobType jobType) async {
    final db = await getOnClocDatabase();
    await db.update(jobTypesTable, jobType.toJson(),
        where: '${JobTypeFields.jobTypeId} = ?',
        whereArgs: [jobType.jobTypeId],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteJobType(int jobTypeId) async {
    final db = await getOnClocDatabase();
    await db.delete(jobTypesTable,
        where: '${JobTypeFields.jobTypeId} = ?', whereArgs: [jobTypeId]);
  }
}

