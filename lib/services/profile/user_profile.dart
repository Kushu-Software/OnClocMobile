import 'package:flutter_guid/flutter_guid.dart';
import 'package:on_cloc_mobile/services/db/database_service.dart';
import 'package:on_cloc_mobile/app/models/profile/user_profile.dart';
import 'package:sqflite/sqflite.dart';

class OnClocUserProfileService {
  static Future<Database> getOnClocDatabase() async {
    return await OnClocDbService().database;
  }

  static Future<UserProfile> getUserProfileById(Guid userProfileId) async {
    final response = await getOnClocDatabase().then((db) =>
        db.query(userProfileTable, where: 'profileId = ?', whereArgs: [userProfileId]));
    return UserProfile.fromJson(response.first);
  }

  static Future<List<UserProfile>> getUserProfiles() async {
    final response =
        await getOnClocDatabase().then((db) => db.query(userProfileTable));
    return response.map((json) => UserProfile.fromJson(json)).toList();
  }

  static Future<void> createUserProfile(UserProfile userProfile) async {
    final db = await getOnClocDatabase();
    await db.insert(userProfileTable, userProfile.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> updateUserProfile(UserProfile userProfile) async {
    final db = await getOnClocDatabase();
    await db.update(userProfileTable, userProfile.toJson(),
        where: 'profileId = ?',
        whereArgs: [userProfile.userProfileId],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> deleteUserProfile(Guid profileId) async {
    final db = await getOnClocDatabase();
    await db.delete(userProfileTable, where: 'profileId = ?', whereArgs: [profileId]);
  }

  static List<UserProfile> getSeedUserProfiles() {
    return [
      UserProfile(
      userProfileId: Guid('d1b3b3b3-3b3b-3b3b-3b3b-3b3b3b3b3b3b'),
      firstName: 'Andrew',
      lastName: 'Owor',
      emailAddress: 'andrew.owor@on-cloc.app',
      phoneNumber: '+256 756 440180',
      profilePicture: 'https://avatars.githubusercontent.com/andrewowor')
    ];
  }
}