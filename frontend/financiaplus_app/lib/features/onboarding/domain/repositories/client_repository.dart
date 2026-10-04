import '../entities/bank_customer.dart';
import '../entities/client.dart';
import '../entities/identity_verification.dart';

abstract class ClientRepository {
  Future<Client> getCurrentClient();

  Future<Client> updateProfile({
    required String address,
    required DateTime birthDate,
    required String gender,
  });

  Future<IdentityVerification> verifyIdentity();

  /// Returns null when the person is not a bank customer.
  Future<BankCustomer?> findBankCustomer(String documentNumber);
}
