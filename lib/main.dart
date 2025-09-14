// lib/main.dart
import 'bank_account.dart';
import 'savings_account.dart';
import 'checking_account.dart';
import 'business_account.dart';

void main() {
  print('--- Base: BankAccount ---');
  var base = BankAccount(owner: 'Alice', accountNumber: 1001, startingBalance: 100.0);
  print(base.info());
  base.deposit(50);
  base.withdraw(30);
  base.withdraw(200); // should fail
  print('Balance getter: \$${base.balance.toStringAsFixed(2)}');

  print('\n--- SavingsAccount ---');
  var sav = SavingsAccount(owner: 'Bob', accountNumber: 2001, startingBalance: 200.0, interestRate: 2.0);
  print(sav.info());
  sav.applyMonthlyInterest();
  sav.withdraw(50);

  print('\n--- CheckingAccount ---');
  var chk = CheckingAccount(owner: 'Carol', accountNumber: 3001, startingBalance: 50.0, overdraftLimit: 100.0);
  print(chk.info());
  chk.setOverdraft(150.0);
  // we will try a withdraw (this will use base withdraw logic)
  var ok = chk.withdraw(120);
  print('Withdraw 120 success: $ok');

  print('\n--- BusinessAccount ---');
  var biz = BusinessAccount(owner: 'Dave', accountNumber: 4001, startingBalance: 500.0, creditLine: 1000.0);
  print(biz.info());
  biz.requestLoan(800); // within credit line
  biz.requestLoan(2000); // denied
  print(biz.info());

  print('\n--- Final balances ---');
  print('Base: \$${base.balance.toStringAsFixed(2)}');
  print('Savings: \$${sav.balance.toStringAsFixed(2)}');
  print('Checking: \$${chk.balance.toStringAsFixed(2)}');
  print('Business: \$${biz.balance.toStringAsFixed(2)}');
}
