class BankAccount {
    // TODO
    final String _name;
    final int _accId;
    double _balance = 0.0;

    BankAccount({required this._name, required this._accId});

    String get name => _name;
    int get accId => _accId;
    double get balance => _balance;

    double withdraw(double amount) {
      if(amount <= 0){
        throw Exception("The amount should be more than 0");
      } 

      _balance = (amount > _balance) ? throw Exception("Insufficient Balance") : _balance - amount;

      return amount;
    }

    double credit(double amount) {
      _balance = (amount <= 0) ? throw Exception("The amount should be more than 0") : _balance + amount;

      return _balance;
    }

}

class Bank {
    // TODO
    final String _bankName;
    List<BankAccount> clients = [];

    Bank({required this._bankName});

    BankAccount createAccount(int accountId, String accountOwner) {
      for(var c in clients){
        if (accountId == c._accId){
          throw Exception("this account already exited.");
        }
      }

      BankAccount newAcc = BankAccount(name: accountOwner, accId: accountId);
      clients.add(newAcc);

      return newAcc;
    }
}
 
void main() {

  Bank myBank = Bank(bankName: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
