/// Validates a Salvadoran identity document number (DUI):
/// eight digits, a hyphen and a check digit.
///
/// The first eight digits are weighted from 9 down to 2. The check
/// digit is 10 minus the last digit of that sum, or 0 when the
/// result is 10. The backend applies the same rule.
bool isValidDui(String value) {
  if (!RegExp(r'^\d{8}-\d$').hasMatch(value)) {
    return false;
  }

  var sum = 0;

  for (var index = 0; index < 8; index++) {
    sum += int.parse(value[index]) * (9 - index);
  }

  final expectedCheckDigit = (10 - (sum % 10)) % 10;

  return int.parse(value[9]) == expectedCheckDigit;
}
