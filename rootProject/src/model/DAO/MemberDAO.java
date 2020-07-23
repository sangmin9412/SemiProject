package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.MemberDTO;

public class MemberDAO extends DataBaseInfo {
	final String COLUMNS = " USER_ID, USER_PW, USER_NAME, USER_BIRTH, USER_GENDER, USER_ADDR, USER_PH1, USER_PH2, USER_REGIST, USER_EMAIL, JOIN_OK ";
	
	public void memberInsert(MemberDTO dto) {
		
	}
	
	public List<MemberDTO> memberSelect(int page, int limit, String userId ) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		String condition = "";
		if(userId != null) condition = " and user_id = ?";
		conn = getConnection();
		sql = " select * from ( select rownum rn, "+COLUMNS+" from ( select "+COLUMNS+" from member where 1=1 "+condition+" order by USER_REGIST  desc )) where rn between ? and ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			if(userId != null) {
				pstmt.setString(1, userId);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}else {
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				System.out.println(rs.getString("user_id"));
				dto.setUserId(rs.getString("user_id"));
				dto.setUserPw(rs.getString("user_pw"));
				dto.setUserName(rs.getString("USER_NAME"));
				dto.setUserBirth(rs.getString("USER_BIRTH"));
				dto.setUserGender(rs.getString("USER_GENDER"));
				dto.setUserAddr(rs.getString("USER_ADDR"));
				dto.setUserPh1(rs.getString("USER_PH1"));
				dto.setUserPh2(rs.getString("USER_PH2"));
				dto.setUserRegist(rs.getTimestamp("USER_REGIST"));
				dto.setUserEmail(rs.getString("USER_EMAIL"));
				dto.setJoinOk(rs.getString("JOIN_OK"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public Integer memberCount() {
		Integer result = 0;
		conn = getConnection();
		sql = "select count(*) from member ";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
	}
	
	
	
	
	
}
