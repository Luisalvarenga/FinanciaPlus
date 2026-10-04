import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/credit_applications.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    CreditApplications,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (migrator, from, to) async {
        // The local database only mirrors server data,
        // so it is recreated when the schema changes.
        for (final table in allTables) {
          await migrator.deleteTable(table.actualTableName);
        }

        // Clients are no longer stored locally (removed in v3).
        await migrator.deleteTable('clients');

        await migrator.createAll();
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final databaseDirectory =
        await getApplicationDocumentsDirectory();

    final file = File(
      p.join(
        databaseDirectory.path,
        'financiaplus.sqlite',
      ),
    );

    return NativeDatabase.createInBackground(file);
  });
}