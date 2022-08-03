package model.member.dao;
/*
 * t_member 테이블에 대한 CRUD 메소드
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.util.ConnectionFactory;
import model.member.vo.MemberVO;

public class MemberDAO {

	public void join(MemberVO member) {
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO MEMBER(ID, PASSWORD,NAME, BIRTH, TEL, EMAIL, ADDRESS) ");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?) ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
				int loc = 1;
				pstmt.setString(loc++, member.getId());
				pstmt.setString(loc++, member.getPassword());
				pstmt.setString(loc++, member.getName());
				pstmt.setString(loc++, member.getBirth());
				pstmt.setString(loc++, member.getTel());
				pstmt.setString(loc++, member.getEmail());
				pstmt.setString(loc++, member.getAddress());
				
				pstmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		
	}

	public MemberVO login(String id, String password) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select * ");
		sql.append(" from member ");
		sql.append(" where id = ? and password = ? ");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				
				ResultSet rs = pstmt.executeQuery();
				
				// id 가 기본키이기 때문에 나올 수 있는 레코드가 0~1개
				if(rs.next()) {
					MemberVO loginVO = new MemberVO();
					loginVO.setId(rs.getString("id"));
					loginVO.setPassword(rs.getString("password"));
					loginVO.setName(rs.getString("name"));
					loginVO.setBirth(rs.getString("birth"));
					loginVO.setTel(rs.getString("tel"));
					loginVO.setEmail(rs.getString("email"));
					loginVO.setAddress(rs.getString("address"));
					loginVO.setRegDate(rs.getString("reg_date"));					
					loginVO.setType(rs.getString("type"));
					
					return loginVO;
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			// 로그인 실패할 경우 null 리턴
			return null;
		
	}

	public MemberVO checkKakao(String email) {
 		
 		StringBuilder sql  = new StringBuilder();
 		sql.append("select id,password,name,type,tel from member where email = ?");
 		try(
 				Connection conn = new ConnectionFactory().getConnection();
 				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
 		) {
			pstmt.setString(1, email);
 			ResultSet rs = pstmt.executeQuery();
 			if(rs.next()) {
 				MemberVO member = new MemberVO();
 				member.setId(rs.getString("id"));
 				member.setName(rs.getString("name"));
 				member.setTel(rs.getString("tel"));
 				member.setType(rs.getString("type"));
 				
 				return member;
 			}
 			
		} catch (Exception e) {
			e.printStackTrace();
		}
 		
 		return null;
 	}
	
	public void insertKakaoUser(MemberVO member) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into member(id,name,email) values(?,?,?) ");
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void updateKakaoUser(String user, String tel) {
 		StringBuilder sql = new StringBuilder();
 		sql.append("update member set tel = ? where id = ?");
		
		try(
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			pstmt.setString(1, tel);
			pstmt.setString(2, user);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
 		
 	}
	
	
	

}
