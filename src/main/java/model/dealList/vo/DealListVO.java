package model.dealList.vo;

public class DealListVO {
	
	private int dealNumber; // 거래번호
	private String bankCode; // 내 계좌 은행코드
	private String accountNumber; // 내 계좌번호
	private int dealAmount; // 거래금액
	private String dealInfo; // 거래정보
	private String depositAccountNumber; // 상대방 계좌
	private String depositBankCode; // 상대방 은행코드
	private String dealDate; // 거래일시 

	public DealListVO() {
		super();
	}

	public int getDealNumber() {
		return dealNumber;
	}

	public void setDealNumber(int dealNumber) {
		this.dealNumber = dealNumber;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public int getDealAmount() {
		return dealAmount;
	}

	public void setDealAmount(int dealAmount) {
		this.dealAmount = dealAmount;
	}

	public String getDealInfo() {
		return dealInfo;
	}

	public void setDealInfo(String dealInfo) {
		this.dealInfo = dealInfo;
	}

	public String getDepositAccountNumber() {
		return depositAccountNumber;
	}

	public void setDepositAccountNumber(String depositAccountNumber) {
		this.depositAccountNumber = depositAccountNumber;
	}

	public String getDepositBankCode() {
		return depositBankCode;
	}

	public void setDepositBankCode(String depositBankCode) {
		this.depositBankCode = depositBankCode;
	}

	public String getDealDate() {
		return dealDate;
	}

	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
	}

	@Override
	public String toString() {
		return "DealListVO [dealNumber=" + dealNumber + ", bankCode=" + bankCode + ", accountNumber=" + accountNumber
				+ ", dealAmount=" + dealAmount + ", dealInfo=" + dealInfo + ", depositAccountNumber="
				+ depositAccountNumber + ", depositBankCode=" + depositBankCode + ", dealDate=" + dealDate + "]";
	}

	



}
