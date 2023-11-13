package test_5;

/**
 * ClassName: Account
 * Package: test_5
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/13 - 14:04
 * @Version: v1.0
 */
public class Account {
    private int id;
    private double balance;//余额
    private double annuaInterestRate;//年利率

    public Account() {
    }

    public Account(int id, double balance, double annuaInterestRate) {
        this.id = id;
        this.balance = balance;
        this.annuaInterestRate = annuaInterestRate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public double getAnnuaInterestRate() {
        return annuaInterestRate;
    }

    public void setAnnuaInterestRate(double annuaInterestRate) {
        this.annuaInterestRate = annuaInterestRate;
    }

    public double geyMonthlyInterest() {
        return annuaInterestRate / 12;
    }

    public void withdraw(double amount) {
        if (balance >= amount) {
            balance -= amount;
        } else {
            System.out.println("余额不足");
        }
    }

    public void deposit(double amount) {
        balance += amount;
        System.out.println("存钱成功");


    }

}
