package service;

import java.util.List;

import model.account.dao.AccountDAO;
import model.account.vo.AccountVO;
import model.dealList.vo.DealListVO;

public class AccountService {
	
	private AccountDAO accountDao;
	
	public AccountService() {
		accountDao = new AccountDAO();
	}

	public void addAccount(AccountVO accountVO) {
		accountDao.addAccount(accountVO);
		
	}

	public List<AccountVO> userAcocuntAll(String id) {
		
		List<AccountVO> accountList = accountDao.userAcocuntAll(id);
		return accountList;
	}

	public void transfer(DealListVO dealList) {
		accountDao.transfer(dealList);
		
	}

	public List<DealListVO> userDealList(String accountNumber) {
		List<DealListVO> userDealList = accountDao.userDealList(accountNumber);
		return userDealList;
	}

	public void transferOpenBanking(DealListVO dealList) {
		accountDao.opentransfer(dealList);
	}
	

}
