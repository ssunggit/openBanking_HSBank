package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.comment.vo.CommentVO;
import model.qnaBoard.vo.QnABoardVO;
import service.CommentService;
import service.QnABoardService;

public class BoardDetailController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		
		QnABoardService service = new QnABoardService();
		
		QnABoardVO board = service.detailBoard(no);
		
		CommentService commentService = new CommentService();
		
		List<CommentVO> commentList = commentService.selectCommentList(no);
		
		request.setAttribute("board", board);
		request.setAttribute("commentList", commentList);
		
		return "/jsp/board/detail.jsp?no="+no;
	}

}
