package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.vo.MemberVO;
import model.qnaBoard.vo.QnABoardVO;
import service.QnABoardService;

public class boardWriteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 로그인한 객체 정보 받아오기
		HttpSession session = request.getSession();
		MemberVO loginVO = (MemberVO)(session.getAttribute("loginVO"));
		
		request.setCharacterEncoding("utf-8");
	
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		QnABoardVO qnaBoardVO = new QnABoardVO();
		qnaBoardVO.setTitle(title);
		qnaBoardVO.setContent(content);
		qnaBoardVO.setWriter(loginVO.getName());
		qnaBoardVO.setId(loginVO.getId());
		
		QnABoardService service = new QnABoardService();
		service.addBoard(qnaBoardVO);
		
		return "redirect:/";
	}

}
