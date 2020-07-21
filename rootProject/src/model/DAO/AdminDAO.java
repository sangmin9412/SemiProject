package model.DAO;

public class AdminDAO extends DataBaseInfo {
	final String COLUMNS = "admin_id, admin_pw, admin_name, admin_ph1, admin_ph2, admin_regist, admin_email, admin_authority";

	public Integer adminLogInChk(String adminId, String adminPw) {
		Integer result = -1;
		conn = getConnection();
		sql = "select admin_pw from admin where admin_id = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (adminPw.equals(rs.getString("admin_pw"))) {
					result = 1; // 로그인 성공
				} else {
					result = 0; // 비밀번호가 다름
				}
				
			} else {
				result = -1; // 아이디가 다름
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	
	
}
