package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.comment.vo.CommentVO;
import service.CommentService;

public class CommentProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		int parentCommmentNo = Integer.parseInt(request.getParameter("parentCommmentNo"));
		
		CommentService service = new CommentService();
		CommentVO parentComment = service.selectParentComment(parentCommmentNo);
		
		CommentVO comment = new CommentVO();
		
		if(parentComment == null) {
	         
			comment.setBoardNo(no);
			comment.setWriter(writer);
			comment.setContent(content);
			comment.setParentCommmentNo(1); 
			comment.setCommentOrder(service.getMaxOrder()+1);
			comment.setDepth(0);
			
	         
	      }else {
	    	comment.setBoardNo(no);
			comment.setWriter(writer);
			comment.setContent(content);
			
			comment.setParentCommmentNo(parentComment.getParentCommmentNo()+1); 
			comment.setCommentOrder(parentComment.getCommentOrder()+1);
			comment.setDepth(parentComment.getDepth()+1);
	        
	        service.updateOrder(no, parentComment.getCommentOrder());
	      }
		
	      System.out.println("보드: "+comment);
	      service.addBoardComment(comment);
	      
	      
	      return "redirect:/detail.do?no="+no;

		
	}

}
