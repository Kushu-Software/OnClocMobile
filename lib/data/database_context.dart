import 'package:on_cloc_mobile/app/models/job/job_card.dart';
import 'package:on_cloc_mobile/app/models/job/job_category.dart';
import 'package:on_cloc_mobile/app/models/job/job_type.dart';
import 'package:on_cloc_mobile/app/models/profile/user_profile.dart';
import 'package:sqflite/sqflite.dart';

class OnClocDbContext {
  static final OnClocDbContext instance = OnClocDbContext.initialize();
  OnClocDbContext.initialize();

  Future createDB(Database onClocDb, int version) async {
    const intKey = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const guidKey = 'TEXT PRIMARY KEY NOT NULL';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const longTextType = 'VARCHAR NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await onClocDb.execute('''CREATE TABLE $userProfileTable ( 
        ${UserProfileFields.userProfileId} $guidKey,
        ${UserProfileFields.firstName} $textType,
        ${UserProfileFields.lastName} $textType,
        ${UserProfileFields.emailAddress} $textType,
        ${UserProfileFields.phoneNumber} $textType,
        ${UserProfileFields.profilePicture} $longTextType,
        )
      ''');

    await onClocDb.execute('''CREATE TABLE $jobTypesTable ( 
      ${JobTypeFields.jobTypeId} $intKey,
      ${JobTypeFields.name} $textType,
      ${JobTypeFields.description} $textType,
      ${JobTypeFields.colourCode} $textType,
      ${JobTypeFields.isSelected} $boolType
      )
    ''');

    await onClocDb.execute('''CREATE TABLE $jobTypeCategoriesTable (
      ${JobTypeCategoryFields.id} $intKey,
      ${JobTypeCategoryFields.jobTypeId} $integerType,
      ${JobTypeCategoryFields.jobCategoryId} $integerType
      )
    ''');

    await onClocDb.execute('''CREATE TABLE $jobCategoriesTable(
      ${JobCategoryFields.jobCategoryId} $intKey,
      ${JobCategoryFields.name} $textType,
      ${JobCategoryFields.description} $textType,
      ${JobCategoryFields.colourCode} $textType,
      ${JobCategoryFields.isSelected} $textType,
      )
    ''');

    await onClocDb.execute('''CREATE TABLE $jobCategoryClassesTable(
      ${JobCategoryClassFields.id} $intKey,
      ${JobCategoryClassFields.jobCategoryId} $integerType,
      ${JobCategoryClassFields.jobClassId} $integerType,
      )
    ''');

    await onClocDb.execute('''CREATE TABLE $jobCardsTable ( 
      ${JobCardFields.jobCardId} $guidKey,
      ${JobCardFields.serviceTicketId} $textType,
      ${JobCardFields.serviceDeskId} $textType,
      ${JobCardFields.userProfileId} $textType,
      ${JobCardFields.isPrimaryTechnician} $boolType,
      ${JobCardFields.jobStatusId} $integerType,
      ${JobCardFields.jobPriorityId} $integerType,
      ${JobCardFields.jobTypeId} $integerType,
      ${JobCardFields.jobCategoryId} $integerType,
      ${JobCardFields.jobClassId} $integerType,
      ${JobCardFields.jobGroupId} $integerType,
      ${JobCardFields.jobGenreId} $integerType,
      ${JobCardFields.jobNumber} $textType,
      ${JobCardFields.jobSubject} $textType,
      ${JobCardFields.jobDescription} $textType,
      ${JobCardFields.jobLocation} $textType,
      ${JobCardFields.assignOnDate} $textType,
      ${JobCardFields.scheduledDate} $textType,
      ${JobCardFields.startDate} $textType,
      ${JobCardFields.endDate} $textType
      ${JobCardFields.createdAt} $textType           
      )
    ''');
  }
}
