package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.account.vo.AccountVO;
import model.member.vo.MemberVO;
import service.AccountService;

public class accountTransferFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO)(session.getAttribute("loginVO"));
		String id = loginVO.getId();
		
		AccountService service = new AccountService();
		List<AccountVO> accountList = service.userAcocuntAll(id);
		request.setAttribute("accountList", accountList);
		
		return "/jsp/account/accountTransfer.jsp";
	}

}
