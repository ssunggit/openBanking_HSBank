package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.vo.MemberVO;

public class boardWriteFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO)(session.getAttribute("loginVO"));
		
		request.setAttribute("loginVO", loginVO);
		
		return "/jsp/board/writeForm.jsp";
	}

}
