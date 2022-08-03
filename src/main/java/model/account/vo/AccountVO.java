package model.account.vo;

public class AccountVO {

	private String accountNumber;
	private String accountPW;
	private String accountAlias;
	private int balance;
	private String bankCode;
	private String openDate;
	private String bankName;
	private String id; // 유저아이디
	
	public AccountVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getAccountNumber() {
		return accountNumber;
	}



	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}



	public String getAccountPW() {
		return accountPW;
	}



	public void setAccountPW(String accountPW) {
		this.accountPW = accountPW;
	}



	public String getAccountAlias() {
		return accountAlias;
	}



	public void setAccountAlias(String accountAlias) {
		this.accountAlias = accountAlias;
	}



	public int getBalance() {
		return balance;
	}



	public void setBalance(int balance) {
		this.balance = balance;
	}



	public String getBankCode() {
		return bankCode;
	}



	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}



	public String getOpenDate() {
		return openDate;
	}



	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "AccountVO [accountNumber=" + accountNumber + ", accountPW=" + accountPW + ", accountAlias="
				+ accountAlias + ", balance=" + balance + ", bankCode=" + bankCode + ", openDate=" + openDate
				+ ", bankName=" + bankName + ", id=" + id + "]";
	}



	

	
	
	
}
