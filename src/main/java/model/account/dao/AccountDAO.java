package model.account.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;
import model.account.vo.AccountVO;
import model.dealList.vo.DealListVO;

public class AccountDAO {
	/**
	 * 계좌 개설 
	 * @param accountVO
	 */
	public void addAccount(AccountVO accountVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO Account(account_number, account_pw, account_alias, balance, bankcode, id) ");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?) ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
				int loc = 1;
				pstmt.setString(loc++, accountVO.getAccountNumber());
				pstmt.setString(loc++, accountVO.getAccountPW());
				pstmt.setString(loc++, accountVO.getAccountAlias());
				pstmt.setInt(loc++, accountVO.getBalance());
				pstmt.setString(loc++, accountVO.getBankCode());
				pstmt.setString(loc++, accountVO.getId());
				
				pstmt.executeUpdate();
		
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		
	}
	
	
	/**
	 * 이체
	 * @param transfer
	 */
	public void transfer(DealListVO dealList) {
		StringBuilder sql = new StringBuilder();
		sql.append(" {call account_transfer_proc1(?, ?, ?, ?, ?)} ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				CallableStatement cstmt = conn.prepareCall(sql.toString());
			){
				int loc = 1;
				cstmt.setString(loc++, dealList.getAccountNumber());
				cstmt.setString(loc++, dealList.getDepositAccountNumber());
				cstmt.setString(loc++, dealList.getBankCode());
				cstmt.setString(loc++, dealList.getDepositBankCode());
				cstmt.setInt(loc++, dealList.getDealAmount());
				
				
                cstmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		
	}
	
	
	/**
	 * 거래내역조회
	 */
public List<DealListVO> userDealList(String accountNumber){
		
		List<DealListVO> userDealList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select deal_number, bank_code, account_number, deal_amount, deal_info, deposit_account_number, deal_date, deposit_bank_code from deal_list ");
		sql.append(" where account_number = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
			pstmt.setString(1, accountNumber);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int dealNumber = rs.getInt("deal_number");
				String bankCode = rs.getString("bank_code");
				String accountNumber1 = rs.getString("account_number");
				int dealAmount = rs.getInt("deal_amount");
				String dealInfo = rs.getString("deal_info");
				String depositAccountNumber = rs.getString("deposit_account_number");
				String dealDate = rs.getString("deal_date");
				String depositBankCode = rs.getString("deposit_bank_code");
				
				DealListVO dealList = new DealListVO();
				
				dealList.setDealNumber(dealNumber);
				dealList.setBankCode(bankCode);
				dealList.setAccountNumber(accountNumber1);
				dealList.setDealAmount(dealAmount);
				dealList.setDealInfo(dealInfo);
				dealList.setDepositAccountNumber(depositAccountNumber);
				dealList.setDealDate(dealDate);
				dealList.setDepositBankCode(depositBankCode);
				
				userDealList.add(dealList);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(userDealList);
		
		return userDealList;
	}
	/**
	 * openBanking 이체 실핼
	 * @param dealList
	 */
	public void opentransfer(DealListVO dealList) {
		
		StringBuilder sql = new StringBuilder();
        sql.append("{CALL OPENBANKING(?, ?, ?, ?, ?)}");
        try (
                Connection conn = new ConnectionFactory().getConnection();
                CallableStatement cstmt = conn.prepareCall(sql.toString());
        ) {
            int loc = 1;
            
            cstmt.setString(loc++, dealList.getDepositAccountNumber());
            cstmt.setInt(loc++, dealList.getDealAmount());
            cstmt.setString(loc++, dealList.getDepositBankCode());
            cstmt.setString(loc++, dealList.getAccountNumber());
            cstmt.setString(loc++, dealList.getBankCode());
            System.out.println(dealList.toString());
            cstmt.execute();
            
            System.out.println("프로시저 실행 완료");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	/**
	 * 로그인한 사용자 계좌 조회
	 */
	public List<AccountVO> userAcocuntAll(String id){
		
		List<AccountVO> accountList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select account_number, account_PW, account_alias, balance, bankcode, bank_name, open_date, id from Account ");
		sql.append(" where id = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String accountNumber = rs.getString("account_number");
				String accountPW = rs.getString("account_pw");
				String accountAlias = rs.getString("account_alias");
				int balance = rs.getInt("balance");
				String bankCode = rs.getString("bankcode");
				String bankName = rs.getString("bank_name");
				String openDate = rs.getString("open_date");
				String id1 = rs.getString("id");

				
				AccountVO account = new AccountVO();
				
				account.setAccountNumber(accountNumber);
				account.setAccountPW(accountPW);
				account.setAccountAlias(accountAlias);
				account.setBalance(balance);
				account.setBankName(bankName);
				account.setBankCode(bankCode);
				account.setOpenDate(openDate);
				
				account.setId(id1);
				
				
				System.out.println("account:" + account);
				accountList.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("account:" + accountList);
		
		return accountList;
	}
	
	
	public List<AccountVO> userAcocuntAllJYP(String id) {
		List<AccountVO> accountList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select account_no, password, account_name, balance, bank_code, opening_date, id from account_tab@Link_JYP ");
		sql.append(" where id = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String accountNumber = rs.getString("account_no");
				String accountPW = rs.getString("password");
				String accountAlias = rs.getString("account_name");
				int balance = rs.getInt("balance");
				String bankCode = rs.getString("bank_code");
				String bankName = "JYP_BANK";
				String openDate = rs.getString("opening_date");
				String id1 = rs.getString("id");

				
				AccountVO account = new AccountVO();
				
				account.setAccountNumber(accountNumber);
				account.setAccountPW(accountPW);
				account.setAccountAlias(accountAlias);
				account.setBalance(balance);
				account.setBankName(bankName);
				account.setBankCode(bankCode);
				account.setOpenDate(openDate);
				
				account.setId(id1);
				
				
				System.out.println("account:" + account);
				accountList.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("account:" + accountList);
		
		return accountList;
	}


	public List<AccountVO> userAcocuntAllYR(String id) {
		List<AccountVO> accountList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select account_num, account_pwd, account_name, balance, bank_code, sign_date, id from account@Link_YR ");
		sql.append(" where id = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String accountNumber = rs.getString("account_num");
				String accountPW = rs.getString("account_pwd");
				String accountAlias = rs.getString("account_name");
				int balance = rs.getInt("balance");
				String bankCode = rs.getString("bank_code");
				String bankName = "YR_BANK";
				String openDate = rs.getString("sign_date");
				String id1 = rs.getString("id");

				
				AccountVO account = new AccountVO();
				
				account.setAccountNumber(accountNumber);
				account.setAccountPW(accountPW);
				account.setAccountAlias(accountAlias);
				account.setBalance(balance);
				account.setBankName(bankName);
				account.setBankCode(bankCode);
				account.setOpenDate(openDate);
				
				account.setId(id1);
				
				
				System.out.println("account:" + account);
				accountList.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("account:" + accountList);
		
		return accountList;
	}


	public List<AccountVO> userAcocuntAllJJ(String id) {
		List<AccountVO> accountList = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder();
		sql.append("select accountnum, accountPW, nickname, balance, bankcode, opendate, id from account@Link_jj ");
		sql.append(" where id = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String accountNumber = rs.getString("accountnum");
				String accountPW = rs.getString("accountPW");
				String accountAlias = rs.getString("nickname");
				int balance = rs.getInt("balance");
				String bankCode = rs.getString("bankcode");
				String bankName = "JJ_BANK";
				String openDate = rs.getString("opendate");
				String id1 = rs.getString("id");

				
				AccountVO account = new AccountVO();
				
				account.setAccountNumber(accountNumber);
				account.setAccountPW(accountPW);
				account.setAccountAlias(accountAlias);
				account.setBalance(balance);
				account.setBankName(bankName);
				account.setBankCode(bankCode);
				account.setOpenDate(openDate);
				
				account.setId(id1);
				
				
				System.out.println("account:" + account);
				accountList.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("account:" + accountList);
		
		return accountList;
	}
	
	

}
