import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class StorageService {
  static const _databaseName = 'engagement_tracker.db';
  static const _databaseVersion = 1;
  static const _tableName = 'pending_events';

  Database? _database;

  Future<void> initialize() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);

    _database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        event_data TEXT NOT NULL,
        created_at INTEGER DEFAULT (strftime('%s', 'now'))
      )
    ''');
  }

  Future<void> storeEvent(String encryptedData) async {
    await _database?.insert(
      _tableName,
      {'event_data': encryptedData},
    );
  }

  Future<List<String>> getPendingEvents({int limit = 50}) async {
    final events = await _database?.query(
      _tableName,
      columns: ['event_data'],
      orderBy: 'created_at ASC',
      limit: limit,
    ) ?? [];

    return events.map((e) => e['event_data'] as String).toList();
  }

  Future<void> clearEvents(List<String> events) async {
    final placeholders = List.filled(events.length, '?').join(',');
    await _database?.delete(
      _tableName,
      where: 'event_data IN ($placeholders)',
      whereArgs: events,
    );
  }

  Future<void> close() async {
    await _database?.close();
    _database = null;
  }
}

