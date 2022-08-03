package service;

import java.util.List;

import model.comment.dao.CommentDAO;
import model.comment.vo.CommentVO;


public class CommentService {
	
	private CommentDAO commentDao;

	public CommentService() {
		commentDao= new CommentDAO();
	}
	
	public List<CommentVO> selectCommentList(int boardNo) {
		List<CommentVO> commentList = commentDao.selectCommentList(boardNo);
		return commentList;
	}

	public CommentVO selectParentComment(int parentCommmentNo) {
		CommentVO parentComment = commentDao.selectParentComment(parentCommmentNo);
		return parentComment;
	}

	public int getMaxOrder() {
		int maxOrder = commentDao.getMaxOrder();
		return maxOrder;
	}

	public void updateOrder(int no, int commentOrder) {
		commentDao.updateOrder(no, commentOrder);
		
	}

	public void addBoardComment(CommentVO comment) {
		int commmentNo = commentDao.selectBoardCommentNo();
		
		comment.setCommmentNo(commmentNo);
		
		commentDao.insertBoardComment(comment);
		
	}
}
