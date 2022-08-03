package model.comment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;
import model.comment.vo.CommentVO;

public class CommentDAO {
	/**
	 * 댓글 리스트 
	 * @param boardNo
	 * @return
	 */
	 public List<CommentVO> selectCommentList(int boardNo){
	      
	      List<CommentVO> commentList = new ArrayList<>();
	      
	      StringBuilder sql = new StringBuilder();
	      sql.append("select * from board_comment where board_no = ? order by comment_order");
	      
	      try(         
	            Connection conn = new ConnectionFactory().getConnection();
	            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	         ){
	            pstmt.setInt(1, boardNo);
	            
	            ResultSet rs = pstmt.executeQuery();
	            
	            while(rs.next()) {
	               int commmentNo = rs.getInt("comment_no");
	               int parentCommmentNo =rs.getInt("PARENT_COMMENT_NO");
	               String content = rs.getString("CONTENT");
	               String writer = rs.getString("WRITER");
	               String writingDate = rs.getString("WRITING_DATE");
	               int depth = rs.getInt("DEPTH");
	               int commentOrder = rs.getInt("COMMENT_ORDER");
	               
	               CommentVO comment = new CommentVO();
	               
	               comment.setBoardNo(boardNo);
	               comment.setCommmentNo(commmentNo);
	               comment.setParentCommmentNo(parentCommmentNo);
	               comment.setContent(content);
	               comment.setWriter(writer);
	               comment.setWritingDate(writingDate);
	               comment.setDepth(depth);
	               comment.setCommentOrder(commentOrder);
	              
	               commentList.add(comment);
	            }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return commentList;
	   }
	 
	 
	 /**
	  * 부모댓글조회
	  */
	 public CommentVO selectParentComment(int parentCommmentNo) {
	      
		 CommentVO comment = new CommentVO();
	      StringBuilder sql = new StringBuilder();
	      sql.append("select * from board_comment where comment_no = ? " );
	      
	      try(
	         Connection conn = new ConnectionFactory().getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	      ) {
	         pstmt.setInt(1, parentCommmentNo);
	         ResultSet rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            
	           int commmentNo = rs.getInt("comment_no");
               int parentCommmentNo1 =rs.getInt("PARENT_COMMENT_NO");
               String content = rs.getString("CONTENT");
               String writer = rs.getString("WRITER");
               String writingDate = rs.getString("WRITING_DATE");
               int depth = rs.getInt("DEPTH");
               int commentOrder = rs.getInt("COMMENT_ORDER");
              
               comment.setCommmentNo(commmentNo);
               comment.setParentCommmentNo(parentCommmentNo1);
               comment.setContent(content);
               comment.setWriter(writer);
               comment.setWritingDate(writingDate);
               comment.setDepth(depth);
               comment.setCommentOrder(commentOrder);
	            
	           return comment;
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return null;
	   }

	 /**
	  * 댓글의 제일 뒷 순서의 번호를 받아옴
	  * @return
	  */
	public int getMaxOrder() {
		   
	      String sql = "select max(COMMENT_ORDER) from board_comment";
	      try(
	            Connection conn = new ConnectionFactory().getConnection();
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	      ) {
	         ResultSet rs = pstmt.executeQuery();
	         rs.next();
	         return rs.getInt(1);
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return 0;
	}

	/**
	 * 댓글의 순서를 업데이트
	 * @param no
	 * @param commentOrder
	 */
	public void updateOrder(int no, int commentOrder) {
		
		 StringBuilder sql = new StringBuilder();
	      sql.append("update board_comment set COMMENT_ORDER = COMMENT_ORDER+1 where board_no = "+no+" and COMMENT_ORDER > "+(commentOrder));

	      try {

	         Connection conn = new ConnectionFactory().getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql.toString());

	         pstmt.executeUpdate();

	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	}

	/**
	 * 다음 댓글 번호
	 * @return
	 */
	public int selectBoardCommentNo() {
		String sql = "select seq_boardComment_comment_no.nextval from dual";
	      try(
	            Connection conn = new ConnectionFactory().getConnection();
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	      ) {
	         ResultSet rs = pstmt.executeQuery();
	         rs.next();
	         return rs.getInt(1);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return 0;
	}

	/**
	 * 댓글 입력
	 * @param comment
	 */
	public void insertBoardComment(CommentVO comment) {
		 
	      StringBuilder sql = new StringBuilder();
	      sql.append("insert into board_comment(BOARD_NO, COMMENT_NO, PARENT_COMMENT_NO, CONTENT, WRITER, DEPTH, COMMENT_ORDER ) values(?,?,?,?,?,?,?) ");
	      
	      try {
	         
	         Connection conn = new ConnectionFactory().getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	         
	         int loc = 1;
	         pstmt.setInt(loc++, comment.getBoardNo());
	         pstmt.setInt(loc++, comment.getCommmentNo());
	         pstmt.setInt(loc++, comment.getParentCommmentNo());
	         pstmt.setString(loc++, comment.getContent());
	         pstmt.setString(loc++, comment.getWriter());
	         pstmt.setInt(loc++, comment.getDepth());
	         pstmt.setInt(loc++, comment.getCommentOrder());
	         
	         pstmt.executeUpdate();
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

		
	}
	 

}
