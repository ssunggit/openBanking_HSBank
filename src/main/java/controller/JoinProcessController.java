package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.vo.MemberVO;
import service.MemberService;

public class JoinProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		MemberVO member = new MemberVO();
		
		member.setId(id);
		member.setPassword(password);
		member.setName(name);
		member.setBirth(birth);
		member.setTel(tel);
		member.setEmail(email);
		member.setAddress(address);
		
		System.out.println(member);
		
//		서비스 호출
		MemberService service = new MemberService();
		service.join(member);
		
		
		return "redirect:/";
	}

}
