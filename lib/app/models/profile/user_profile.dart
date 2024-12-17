import 'package:flutter_guid/flutter_guid.dart';

const String userProfileTable = 'user_profiles';

class UserProfileFields {
  static final List<String> values = [
    userProfileId,
    firstName,
    lastName,
    emailAddress,
    phoneNumber,
    profilePicture,
  ];

  static const String userProfileId = 'userProfileId';
  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String emailAddress = 'emailAddress';
  static const String phoneNumber = 'phoneNumber';
  static const String profilePicture = 'profilePicture';
}

class UserProfile {
  final Guid userProfileId;
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String phoneNumber;
  final String profilePicture;

  const UserProfile({
    required this.userProfileId,
    this.firstName = '',
    this.lastName = '',
    this.emailAddress = '',
    this.phoneNumber = '',
    this.profilePicture = '',
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        userProfileId: json['userProfileId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        emailAddress: json['emailAddress'],
        phoneNumber: json['phoneNumber'],
        profilePicture: json['profilePicture'],
      );

  Map<String, dynamic> toJson() => {
        'userProfileId': userProfileId,
        'firstName': firstName,
        'lastName': lastName,
        'emailAddress': emailAddress,
        'phoneNumber': phoneNumber,
        'profilePicture': profilePicture,
      };
}
