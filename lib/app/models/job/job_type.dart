import 'package:get/get.dart';

const String jobTypesTable = 'job_types';
const String jobTypeCategoriesTable = 'job_type_categories';

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

  factory JobType.fromJson(Map<String, dynamic> json) {
    return JobType(
      jobTypeId: json['jobTypeId'],
      name: json['name'],
      description: json['description'],
      colourCode: json['colourCode'],
      isSelected: json['isSelected'],
    );
  }

  Map<String, dynamic> toJson() {
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

  factory JobTypeCategory.fromJson(Map<String, dynamic> json) {
    return JobTypeCategory(
      id: json['id'],
      jobTypeId: json['jobTypeId'],
      jobCategoryId: json['jobCategoryId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jobTypeId': jobTypeId,
      'jobCategoryId': jobCategoryId,
    };
  }
}