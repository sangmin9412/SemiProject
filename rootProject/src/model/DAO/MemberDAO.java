package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.MemberDTO;

public class MemberDAO extends DataBaseInfo {
	final String COLUMNS = " USER_ID, USER_PW, USER_NAME, USER_BIRTH, USER_GENDER, USER_ADDR, USER_PH1, USER_PH2, USER_REGIST, USER_EMAIL, JOIN_OK ";
	
	public void memberInsert(MemberDTO dto) {
		Integer i = null; 
		conn = getConnection();
		sql = "insert into member ( "+ COLUMNS +" )"
			+ "values(?,?,?,?,?,?,?,?,sysdate,?,null)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPw());
			pstmt.setString(3, dto.getUserName());
			pstmt.setTimestamp(4, dto.getUserBirth());
			pstmt.setString(5, dto.getUserGender());
			pstmt.setString(6, dto.getUserAddr());
			pstmt.setString(7, dto.getUserPh1());
			pstmt.setString(8, dto.getUserPh2());
			pstmt.setString(9, dto.getUserEmail());
			i = pstmt.executeUpdate();
			System.out.println(i + "개가 저장되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}		
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
				dto.setUserId(rs.getString("user_id"));
				dto.setUserPw(rs.getString("user_pw"));
				dto.setUserName(rs.getString("USER_NAME"));
				dto.setUserBirth(rs.getTimestamp("USER_BIRTH"));
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
	
	public void memberUpdate(MemberDTO dto) {
		conn = getConnection();
		sql = " update member set user_id=?, user_pw=?, user_name=?, user_ph1=?, user_ph2=?, user_birth=?, user_email=?, user_addr=? where user_id=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPw());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getUserPh1());
			pstmt.setString(5, dto.getUserPh2());
			pstmt.setTimestamp(6, dto.getUserBirth());
			pstmt.setString(7, dto.getUserEmail());
			pstmt.setString(8, dto.getUserAddr());
			pstmt.setString(9, dto.getUserId());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개의 유저 정보가 변경되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public void memberDelete(String userId) {
		conn = getConnection();
		sql = "delete from member where user_id = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			int i = pstmt.executeUpdate();
			System.out.println(i + " 개의 유저정보가 삭제되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	
}
