import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';

class CreditApplicationLocalDataSource {
  CreditApplicationLocalDataSource(this._database);

  final AppDatabase _database;

  Future<int> insertApplication({
    required int clientId,
    required int? serverId,
    required int requestedAmountCents,
    required double? creditScore,
    required bool amlMatch,
    required String status,
    String? ipAddress,
    String? country,
    String? region,
    String? city,
    DateTime? createdAt,
  }) {
    return _database
        .into(_database.creditApplications)
        .insert(
          CreditApplicationsCompanion.insert(
            clientId: clientId,
            serverId: Value(serverId),
            requestedAmountCents: requestedAmountCents,
            creditScore: Value(creditScore),
            amlMatch: Value(amlMatch),
            status: status,
            ipAddress: Value(ipAddress),
            country: Value(country),
            region: Value(region),
            city: Value(city),
            createdAt: createdAt == null
                ? const Value.absent()
                : Value(createdAt),
          ),
        );
  }

  Future<LocalCreditApplication?> getApplicationById(
    int id,
  ) {
    return (_database.select(_database.creditApplications)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<LocalCreditApplication>> getApplicationsByClientId(
    int clientId,
  ) {
    return (_database.select(_database.creditApplications)
          ..where((table) => table.clientId.equals(clientId)))
        .get();
  }
}