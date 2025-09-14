// lib/checking_account.dart
import 'bank_account.dart';

class CheckingAccount extends BankAccount {
  double overdraftLimit;

  CheckingAccount({
    required String owner,
    required int accountNumber,
    double startingBalance = 0.0,
    this.overdraftLimit = 0.0,
  }) : super(owner: owner, accountNumber: accountNumber, startingBalance: startingBalance);

  // Unique method: set overdraft
  void setOverdraft(double limit) {
    if (limit < 0) {
      print('Overdraft must be >= 0.');
      return;
    }
    overdraftLimit = limit;
    print('Overdraft limit set to \$${overdraftLimit.toStringAsFixed(2)}');
  }

  // Optionally we could override withdraw to allow overdraft. For clarity we keep encapsulation simple.
}
