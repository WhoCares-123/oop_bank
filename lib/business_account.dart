// lib/business_account.dart
import 'bank_account.dart';

class BusinessAccount extends BankAccount {
  double creditLine;

  BusinessAccount({
    required String owner,
    required int accountNumber,
    double startingBalance = 0.0,
    this.creditLine = 500.0,
  }) : super(owner: owner, accountNumber: accountNumber, startingBalance: startingBalance);

  // Unique method: request loan
  void requestLoan(double amount) {
    if (amount <= 0 || amount > creditLine) {
      print('Loan request denied.');
    } else {
      deposit(amount);
      print('Loan of \$${amount.toStringAsFixed(2)} approved and added to balance.');
    }
  }

  // Override info to include credit line
  @override
  String info() => 'BusinessAccount(${owner}) — Credit line: \$${creditLine.toStringAsFixed(2)}, Balance: \$${balance.toStringAsFixed(2)}';
}
