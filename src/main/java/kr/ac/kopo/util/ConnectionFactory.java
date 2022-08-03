package kr.ac.kopo.util;

import java.sql.Connection;
import java.sql.DriverManager;
// 1-2단계
public class ConnectionFactory {
//	try-catch 빼고 throws로도 가능
	public Connection getConnection() {
		Connection conn = null;
		try {			
			Class.forName("oracle.jdbc.driver.OracleDriver");	
			
			String url = "jdbc:oracle:thin:@clouddb_medium?TNS_ADMIN=C:/Users/ehxhf/Desktop/oraclecloud/Wallet_CloudDB/";
			String user = "admin";
			String password = "Gustjd2260341010";
			
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
//	public static void main(String[] args) {
//		
//		System.out.println(new ConnectionFactory().getConnection());
//	}
}
