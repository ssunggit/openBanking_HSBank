package model.qnaBoard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;
import model.qnaBoard.vo.QnABoardVO;

public class QnABoardDAO {
	/**
	 * 시퀀스 생성 board NO
	 * @return
	 */
	public int selectBoardNo() {
		
		String sql = "select QNABOARD_NO_seq.nextval from dual ";
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		) {
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	/**
	 * 게시글 작성
	 * @param qnaBoardVO
	 */
	public void addBoard(QnABoardVO qnaBoardVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO QNABOARD(NO, TITLE, CONTENT, WRITER, ID) ");
		sql.append(" VALUES(?, ?, ?, ?, ?) ");
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
				int loc = 1;
				pstmt.setInt(loc++, qnaBoardVO.getNo());
				pstmt.setString(loc++, qnaBoardVO.getTitle());
				pstmt.setString(loc++, qnaBoardVO.getContent());
				pstmt.setString(loc++, qnaBoardVO.getWriter());
				pstmt.setString(loc++, qnaBoardVO.getId());
				                          
				pstmt.executeUpdate();
		
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		
	}
	/**
	 * 게시글 리스트 
	 * @return
	 */
	public List<QnABoardVO> boardList() {
		List<QnABoardVO> boardList = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, content, writer, to_char(writing_time,'YYYY-MM-DD') as writing_time, id from qnaboard ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				String writingTime = rs.getString("writing_time");
				String id = rs.getString("id");
				
				QnABoardVO board = new QnABoardVO();
				board.setNo(no);
				board.setTitle(title);
				board.setContent(content);
				board.setWriter(writer);
				board.setWritingTime(writingTime);
				
				boardList.add(board);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardList;
	}
	/**
	 * 상세 게시글 조회
	 * @param no
	 * @return
	 */
	public QnABoardVO detailBoard(int no) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, content, writer, to_char(writing_time,'YYYY-MM-DD') as writing_time, id  from qnaboard ");
		sql.append(" where no = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int boardNo = rs.getInt("no");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				String writingTime = rs.getString("writing_time");
				String id = rs.getString("id");
				
				QnABoardVO board = new QnABoardVO();
				
				board.setNo(boardNo);
				board.setTitle(title);
				board.setContent(content);
				board.setWriter(writer);
				board.setWritingTime(writingTime);
				
				return board;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
