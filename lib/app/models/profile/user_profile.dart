import 'package:flutter_guid/flutter_guid.dart';

const String userProfileTable = 'user_profiles';

class UserProfileFields{
    static final List<String> values = [
        userProfileId,
        firstName,
        lastName,
        emailAddress,
        phoneNumber,
        profilePicture,
        createdAt,
    ];

    static const String userProfileId = 'userProfileId';
    static const String firstName = 'firstName';
    static const String lastName = 'lastName';
    static const String emailAddress = 'emailAddress';
    static const String phoneNumber = 'phoneNumber';
    static const String profilePicture = 'profilePicture';
    static const String createdAt = 'createdAt';
}

class UserProfile{
    final Guid userProfileId;
    final String firstName;
    final String lastName;
    final String emailAddress;
    final String phoneNumber;
    final String profilePicture;
    final String createdAt;

    const UserProfile({
        required this.userProfileId,
        this.firstName = '',
        this.lastName = '',
        this.emailAddress = '',
        this.phoneNumber = '',
        this.profilePicture = '',
        this.createdAt = '',
    });

    factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        userProfileId: json['userProfileId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        emailAddress: json['emailAddress'],
        phoneNumber: json['phoneNumber'],
        profilePicture: json['profilePicture'],
        createdAt: json['createdAt'],
    );

    Map<String, dynamic> toJson() => {
        'userProfileId': userProfileId,
        'firstName': firstName,
        'lastName': lastName,
        'emailAddress': emailAddress,
        'phoneNumber': phoneNumber,
        'profilePicture': profilePicture,
        'createdAt': createdAt,
    };
}