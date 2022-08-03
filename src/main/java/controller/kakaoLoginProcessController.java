package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.vo.MemberVO;
import service.MemberService;

public class kakaoLoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
	      String name = request.getParameter("name");
	      String email = request.getParameter("email");
	      System.out.println(name+email);
	      int idx = email.indexOf("@");
	      String emailId = email.substring(0, idx);
	      
	      MemberService service = new MemberService();
	      MemberVO member = service.checkKaKao(email);
	      MemberVO member2 = new MemberVO();
	      
	      HttpSession session = request.getSession();
	      
	      if(member != null) {
	         session.setAttribute("loginVO", member);
	         return "redirect:/";
	      }else {
	         
	         member2.setName(name);
	         member2.setId(emailId);
	         member2.setEmail(email);
	         member2.setTel("0");
	         service.insertKakaoUser(member2);
	         session.setAttribute("loginVO", member2);

	         return "redirect:/kakoLoginProcess.do?name="+name+"&&email="+email;
	      }

	}

}
