import java.util.*;

class BankAccount{
    private int id;
    private int balance;

    public BankAccount(int acID){
        id = acID;
        balance = 0;
    }

    void deposit(int amt){
        balance += amt;
        System.out.println("Succesfully deposited "+amt+".\nCurrent Balance: "+balance);
    }

    void withdraw(int amt){
        if(balance >= amt){
            balance-=amt;
            System.out.println("Successfully withdrew "+amt+".\nCurrent Balance: "+balance);
        }
        else{
            System.out.println("Unable to withdraw "+amt+" due to insufficient funds.");
        }
    }

    void checkBal(){
        System.out.println("Balance for Account ID "+id+": "+balance);
    }
}

class prac{
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);

        BankAccount acc = new BankAccount(101);
        while(true){
            System.out.println("Press the number corresponding to your choice:\n1. Deposit some amount.\n2. Withdraw some amount.\n3. Check current balance.\nAnything else. Exit.");
            int choice = sc.nextInt();

            if(choice == 1){
                System.out.print("Enter amt: ");
                int amt = sc.nextInt();
                acc.deposit(amt);
            }
            else if(choice == 2){
                System.out.print("Enter amt: ");
                int amt = sc.nextInt();
                acc.withdraw(amt);
            }
            else if(choice == 3){
                acc.checkBal();
            }
            else{
                break;
            }
        }

        sc.close();
    }
}
