public class BankAccount {
    final private String password;  //q1
    private double balance;         //q2,q3

    public BankAccount(double initialBalance, String password){
        this.balance = initialBalance;      //q4
        this.password = password;
    }

    public double getBalance() {
        return balance;
    }

    public void deposit(double deposit){
        if (deposit <=0){           //q5
            System.out.println("Error: Deposit amount must be positive!");
        }
        else{
            this.balance+=deposit;
        }
    }

    public boolean withdraw(double amount, String enteredPassword){     //q6
        if(!this.password.equals(enteredPassword)){                     //q7
            //throw NotAllowedException;
            System.out.println("Error: Unable to authenticate!");       //placeholder text for error
            return false;
        }
        else if(amount<=0){
            //throw NotAllowedException
            System.out.println("Error: Withdraw amount must be positive!");
            return false;
        }
        else{
            this.balance -= amount;
            return true;
        }
    }

    public String seePassword(String currentPassword){
        if(this.password.equals(currentPassword)){      //q8
            return "Your password is: "+password;
        }
        else{
            return "Incorrect Password!";
        }
    }
}