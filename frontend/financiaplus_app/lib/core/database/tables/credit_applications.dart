import 'package:drift/drift.dart';

@DataClassName('LocalCreditApplication')
class CreditApplications extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get clientId => integer()();

  IntColumn get serverId => integer().nullable()();

  IntColumn get requestedAmountCents => integer()();

  RealColumn get creditScore => real().nullable()();

  BoolColumn get amlMatch => boolean().nullable()();

  TextColumn get status => text()();

  TextColumn get ipAddress => text().nullable()();

  TextColumn get country => text().nullable()();

  TextColumn get region => text().nullable()();

  TextColumn get city => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}