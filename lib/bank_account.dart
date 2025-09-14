// lib/bank_account.dart
class BankAccount {
  final String owner;
  double _balance;
  int _accountNumber;

  BankAccount({
    required this.owner,
    required int accountNumber,
    double startingBalance = 0.0,
  })  : _accountNumber = accountNumber,
        _balance = startingBalance;

  // Getter for balance (read-only)
  double get balance => _balance;

  // Getter + setter for accountNumber (setter validates)
  int get accountNumber => _accountNumber;
  set accountNumber(int value) {
    if (value <= 0) {
      throw ArgumentError('Account number must be a positive integer.');
    }
    _accountNumber = value;
  }

  // deposit (must be positive)
  void deposit(double amount) {
    if (amount <= 0) {
      print('Deposit failed: amount must be positive.');
      return;
    }
    _balance += amount;
    print('Deposit: \$${amount.toStringAsFixed(2)} -> New balance: \$${_balance.toStringAsFixed(2)}');
  }

  // withdraw (validate and return true if successful)
  bool withdraw(double amount) {
    if (amount <= 0) {
      print('Withdraw failed: amount must be positive.');
      return false;
    }
    if (amount > _balance) {
      print('Withdraw failed: insufficient funds.');
      return false;
    }
    _balance -= amount;
    print('Withdraw: \$${amount.toStringAsFixed(2)} -> New balance: \$${_balance.toStringAsFixed(2)}');
    return true;
  }

  // helper info
  String info() => 'Account #${_accountNumber} (${owner}) — Balance: \$${_balance.toStringAsFixed(2)}';
}
