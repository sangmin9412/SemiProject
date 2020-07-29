package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DataBaseInfo {
	String jdbcDriver;
	String jdbcUrl;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;
	
	public DataBaseInfo() {
		jdbcDriver = "oracle.jdbc.driver.OracleDriver";
		jdbcUrl = "jdbc:oracle:thin:@172.16.3.18:1521:xe";
	}
	
	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(jdbcDriver);
			con = DriverManager.getConnection(jdbcUrl, "semi", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public void close() {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateReadCount(String num, String tableName) {
		// System.out.println("[updateReadCount]");
		
		conn = getConnection();
		sql = " update " + tableName
				+ " set READ_COUNT = READ_COUNT + 1 "
				+ " where BOARD_NUM = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			int i = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void updateReadCount(String num) {
		conn = getConnection();
		sql = " update goods "
				+ " set READ_COUNT = READ_COUNT + 1 "
				+ " where GOODS_NUM = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			int i = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public int selectListCount(String tableName) {
		int result = 0;
		conn = getConnection();
		sql = "select count(*) as cnt from " + tableName;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	
	public int selectListCount(String tableName, String where1, String where2) {
		int result = 0;
		conn = getConnection();
		sql = "select count(*) as cnt from ? where ? = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tableName);
			pstmt.setString(2, where1);
			pstmt.setString(3, where2);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}

}
