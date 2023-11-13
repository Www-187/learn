package test_5;

/**
 * ClassName: CheckAccount
 * Package: test_5
 * Description:
 *
 * @Author: www
 * @Create: 2023/3/13 - 14:12
 * @Version: v1.0
 */
public class CheckAccount extends Account {
    private double voerdraft;

    public CheckAccount() {

    }

    public CheckAccount(double voerdraft) {
        this.voerdraft = voerdraft;
    }

    public CheckAccount(int id, double balance, double annuaInterestRate, double voerdraft) {
        super(id, balance, annuaInterestRate);
        this.voerdraft = voerdraft;
    }

    @Override
    public void withdraw(double amount) {
        if (super.getBalance() >= amount) {
            super.withdraw(amount);
        } else if (super.getBalance() + voerdraft >= amount) {
            voerdraft -= (amount - getBalance());
            setBalance(0);
        } else {
            System.out.println("透支余额不足");
        }
    }


}
