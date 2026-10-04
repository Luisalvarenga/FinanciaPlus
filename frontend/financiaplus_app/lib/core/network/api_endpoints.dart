class ApiEndpoints {
  ApiEndpoints._();

  static const String health = '/api/health';

  static const String auth = '/api/auth';

  static const String login = '/api/auth/login';

  static const String register = '/api/auth/register';

  static const String currentClient = '/api/clients/me';

  static const String identityVerification =
      '/api/clients/me/identity-verification';

  static const String creditApplications = '/api/credit-applications';

  static const String aml = '/api/aml';

  static const String creditScore = '/api/credit-score';

  static const String bankCustomers = '/api/bank-customers';
}