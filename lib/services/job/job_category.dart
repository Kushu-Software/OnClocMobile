import 'package:on_cloc_mobile/services/db/database_service.dart';
import 'package:on_cloc_mobile/app/models/job/job_category.dart';
import 'package:sqflite/sqflite.dart';

class JobCategoryService {
  Future<Database> getOnClocDatabase() async {
    return await OnClocDbService().database;
  }

  Future<List<JobCategory>?> getJobCategories() async {
    final response =
        await getOnClocDatabase().then((db) => db.query(jobCategoriesTable));
    return response.isNotEmpty
        ? response.map((e) => JobCategory.fromJson(e)).toList()
        : [];
  }

  Future<JobCategory> getJobCategoryById(int jobCategoryId) async {
    final response = await getOnClocDatabase().then((db) => db.query(
        jobCategoriesTable,
        where: '${JobCategoryFields.jobCategoryId} = ?',
        whereArgs: [jobCategoryId]));
    return JobCategory.fromJson(response.first);
  }

  Future<void> createJobCategory(JobCategory jobCategory) async {
    final db = await getOnClocDatabase();
    await db.insert(jobCategoriesTable, jobCategory.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateJobCategory(JobCategory jobCategory) async {
    final db = await getOnClocDatabase();
    await db.update(jobCategoriesTable, jobCategory.toJson(),
        where: '${JobCategoryFields.jobCategoryId} = ?',
        whereArgs: [jobCategory.jobCategoryId],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteJobCategory(int jobCategoryId) async {
    final db = await getOnClocDatabase();
    await db.delete(jobCategoriesTable,
        where: '${JobCategoryFields.jobCategoryId} = ?',
        whereArgs: [jobCategoryId]);
  }
}
