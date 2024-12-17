import 'package:get/get.dart';

const String jobTypesTable = 'job_Types';
const String jobTypeCategoriesTable = 'job_Type_Categories';

class JobTypeFields {
  static final List<String> values = [
    jobTypeId,
    name,
    description,
    colourCode,
    isSelected,
  ];

  static const String jobTypeId = 'jobTypeId';
  static const String name = 'name';
  static const String description = 'description';
  static const String colourCode = 'colourCode';
  static const String isSelected = 'isSelected';
}

class JobTypeCategoryFields {
  static final List<String> values = [
    id,
    jobTypeId,
    jobCategoryId,
  ];

  static const String id = 'id';
  static const String jobTypeId = 'jobTypeId';
  static const String jobCategoryId = 'jobCategoryId';
}

class JobType {
  final int jobTypeId;
  final String name;
  final String description;
  final String colourCode;
  final RxBool isSelected;

  JobType({
    required this.jobTypeId,
    required this.name,
    this.description = '',
    this.colourCode = '',
    bool isSelected = false,
  }) : isSelected = isSelected.obs;

  factory JobType.fromMap(Map<String, dynamic> map) {
    return JobType(
      jobTypeId: map['jobTypeId'],
      name: map['name'],
      description: map['description'],
      colourCode: map['colourCode'],
      isSelected: map['isSelected'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'jobTypeId': jobTypeId,
      'name': name,
      'description': description,
      'colourCode': colourCode,
      'isSelected': isSelected,
    };
  }
}

class JobTypeCategory{
  final int id;
  final int jobTypeId;
  final int jobCategoryId;

  JobTypeCategory({
    required this.id,
    required this.jobTypeId,
    required this.jobCategoryId,
  });

  factory JobTypeCategory.fromMap(Map<String, dynamic> map) {
    return JobTypeCategory(
      id: map['id'],
      jobTypeId: map['jobTypeId'],
      jobCategoryId: map['jobCategoryId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'jobTypeId': jobTypeId,
      'jobCategoryId': jobCategoryId,
    };
  }
}