// lib/savings_account.dart
import 'bank_account.dart';

class SavingsAccount extends BankAccount {
  double interestRate; // percent, e.g., 1.5 for 1.5%

  SavingsAccount({
    required String owner,
    required int accountNumber,
    double startingBalance = 0.0,
    this.interestRate = 1.0,
  }) : super(owner: owner, accountNumber: accountNumber, startingBalance: startingBalance);

  // Unique method: apply monthly interest
  void applyMonthlyInterest() {
    if (interestRate <= 0) {
      print('Interest not applied: rate must be positive.');
      return;
    }
    double interest = balance * (interestRate / 100.0);
    deposit(interest); // uses parent deposit (validation)
    print('Applied ${interestRate.toStringAsFixed(2)}% interest: \$${interest.toStringAsFixed(2)} added.');
  }

  // Override withdraw to add a small fee
  @override
  bool withdraw(double amount) {
    const double fee = 1.00;
    print('SavingsAccount: attempting to withdraw \$${amount.toStringAsFixed(2)} (fee \$${fee.toStringAsFixed(2)})');
    return super.withdraw(amount + fee);
  }
}
