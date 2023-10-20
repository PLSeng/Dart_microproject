void main() {
  CityBank account = CityBank(
    account: 132435472812, 
    balance: 0,
  );
  
  account.checkBalance();
	/* write your code here */
  account.deposit(100);
  account.checkBalance();
	/* write your code here */
  account.withdraw(30);
  account.checkBalance();
}

class Bank {
  int account;
  double balance;
  
  Bank({
    required this.account, 
    required this.balance,
  });
  
  /* write your code here */
  void deposit(double amount){
    balance += amount;
  }
  
  /* write your code here */
  void withdraw(double amount){
    balance -= amount;
  }
  
  void checkBalance() {
    String str = account.toString();
    String acct = str.substring(0,6) + '-' 
      + str.substring(6,8) + '-' 
      + str.substring(8,12);
    print(
      'account: $acct\n'
      'balance: $balance'
    );
  }
}

class CityBank extends Bank/* write your code here */ {
  CityBank({
    account,
    balance,
  }) : super(
    account: account,
    balance: balance,
  );
}