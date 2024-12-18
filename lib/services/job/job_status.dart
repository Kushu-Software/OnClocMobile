import 'package:on_cloc_mobile/services/db/database_service.dart';
import 'package:on_cloc_mobile/app/models/job/job_status.dart';
import 'package:sqflite/sqflite.dart';

class JobStatusService {
  Future<Database> getOnClocDatabase() async {
    return await OnClocDbService().database;
  }

  Future<List<JobStatus>?> getJobStatuses() async {
    final response = await getOnClocDatabase().then((db) => db.query(jobStatusesTable));
    return response.isNotEmpty ? response.map((e) => JobStatus.fromJson(e)).toList() : [];
  }
}