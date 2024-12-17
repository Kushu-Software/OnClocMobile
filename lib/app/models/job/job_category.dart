import 'package:get/get.dart';

const String jobCategoriesTable = 'job_categories';
const String jobCategoryClassesTable = 'job_category_classes';

class JobCategoryFields {
  static final List<String> values = [
    jobCategoryId,
    name,
    description,
    colourCode,
    isSelected
  ];

  static const String jobCategoryId = 'jobCategoryId';
  static const String name = 'name';
  static const String description = 'description';
  static const String colourCode = 'colourCode';
  static const String isSelected = 'isSelected';
}

class JobCategoryClassFields {
  static final List<String> values = [
    id,
    jobCategoryId,
    jobClassId,
  ];

  static const String id = 'id';
  static const String jobCategoryId = 'jobCategoryId';
  static const String jobClassId = 'jobClassId';
}

class JobCategory {
  final int jobCategoryId;
  final String name;
  final String description;
  final String colourCode;
  final RxBool isSelected;

  JobCategory({
    required this.jobCategoryId,
    required this.name,
    this.description = '',
    this.colourCode = '',
    bool isSelected = false,
  }) : isSelected = isSelected.obs;

  factory JobCategory.fromJson(Map<String, dynamic> json) {
    return JobCategory(
      jobCategoryId: json['jobCategoryId'],
      name: json['name'],
      description: json['description'],
      colourCode: json['colourCode'],
      isSelected: json['isSelected'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobCategoryId': jobCategoryId,
      'name': name,
      'description': description,
      'colourCode': colourCode,
      'isSelected': isSelected
    };
  }
}

class JobCategoryClass {
  final int id;
  final int jobCategoryId;
  final int jobClassId;

  JobCategoryClass({
    required this.id,
    required this.jobCategoryId,
    required this.jobClassId,
  });

  factory JobCategoryClass.fromJson(Map<String, dynamic> json) {
    return JobCategoryClass(
      id: json['id'],
      jobCategoryId: json['jobCategoryId'],
      jobClassId: json['jobClassId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jobCategoryId': jobCategoryId,
      'jobClassId': jobClassId,
    };
  }
}