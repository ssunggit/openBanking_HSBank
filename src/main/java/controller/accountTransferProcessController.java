package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dealList.vo.DealListVO;
import service.AccountService;

public class accountTransferProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String accountNumber = request.getParameter("accountNumber");
		String depositBankCode = request.getParameter("depositBankCode"); // 입금받을 상대방 은행코드
		String depositAccountNumber = request.getParameter("depositAccountNumber");
		int dealAmount = Integer.parseInt(request.getParameter("dealAmount"));
		
		DealListVO dealList = new DealListVO();
		
		dealList.setAccountNumber(accountNumber);
		// 은행코드 수정
		dealList.setBankCode("003");
		dealList.setDepositBankCode(depositBankCode);
		dealList.setDepositAccountNumber(depositAccountNumber);
		dealList.setDealAmount(dealAmount);
		
		AccountService service = new AccountService();
		if (depositBankCode.equals("003")) {
			service.transfer(dealList);
			return "redirect:/";
		}
		
		service.transferOpenBanking(dealList);
		
		return "redirect:/";
	}

}
