package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dealList.vo.DealListVO;
import service.AccountService;

public class accountTransferListFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String accountNumber = request.getParameter("accountNumber");
		System.out.println(" accountTransferListFormController [accountNumber]"+accountNumber);
		
		AccountService service = new AccountService();
		List<DealListVO> userDealList = service.userDealList(accountNumber);
		
		request.setAttribute("userDealList", userDealList);
		
		System.out.println("accountTransferListFormController[ userDealList ] " + userDealList);
		
		return "/jsp/account/dealList2.jsp";
		
	}

}
