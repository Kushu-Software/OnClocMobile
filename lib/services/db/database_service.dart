import 'package:on_cloc_mobile/data/database_context.dart';
import 'package:on_cloc_mobile/data/database_initializer.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class OnClocDbService {
  static const dbVersion = 1;
  static const onClocDbName = 'OnClocMobileDB.db';

  static final OnClocDbContext instance = OnClocDbContext.instance;

  static Database? onClocDatabase;

  Future<Database> get database async {
    if (onClocDatabase != null) return onClocDatabase!;

    onClocDatabase = await initializeDB(onClocDbName);
    if (onClocDatabase != null) {
      OnClocDataInitializer.seedDatabase();
    }
    return onClocDatabase!;
  }

  Future<Database> initializeDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(path, version: dbVersion, onCreate: instance.createDB);
  }

  Future close() async{
    final db = await database;

    db.close();
  }
}
