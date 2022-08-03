package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.vo.MemberVO;
import service.MemberService;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberService service = new MemberService();
		MemberVO loginVO = service.login(id, password);
		
		if(loginVO != null) {
		
			HttpSession session = request.getSession();
			session.setAttribute("loginVO", loginVO);
			
			// page-context 가 뒤에 있음
			return "redirect:";
		}
		// 로그인 실패		
		return "redirect:/loginForm.do";
	}

}
