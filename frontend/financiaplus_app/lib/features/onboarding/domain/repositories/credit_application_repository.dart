import '../entities/credit_application.dart';

abstract class CreditApplicationRepository {
  Future<CreditApplication> createApplication({
    required double requestedAmount,
  });

  /// Applications of the signed-in person, newest first.
  Future<List<CreditApplication>> getApplications();
}
