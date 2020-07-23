package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.EventBoardDTO;

public class EventBoardDAO extends DataBaseInfo {
	final String COLUMNS = "BOARD_NUM, ADMIN_ID, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT, BOARD_DATE, IP_ADDR, READ_COUNT, STORE_FILE_NAME, START_DATE, END_DATE";

	public void eventInsert(EventBoardDTO dto) {
		conn = getConnection();
		sql = "insert into eventboard ("+COLUMNS+") "
				+ " values(SEQ_EVENT.nextval, ?, ?, ?, ?, ?, sysdate, ?, 0, ?, ?, ?) ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getAdminId());
			pstmt.setString(2, null);
			pstmt.setString(3, null);
			pstmt.setString(4, dto.getBoardSubject());
			pstmt.setString(5, dto.getBoardContent());
			pstmt.setString(6, dto.getIpAddr());
			pstmt.setString(7, dto.getStoreFileName());
			pstmt.setTimestamp(8, dto.getStartDate());
			pstmt.setTimestamp(9, dto.getEndDate());
			int i = pstmt.executeUpdate();
			System.out.println(i + " 개의 이벤트가 등록되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	public List<EventBoardDTO> eventSelectAll(int page, int limit, String num) {
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		String condition = "";
		if (num != null) {
			condition = " and board_num = " + num;
		}
		List<EventBoardDTO> list = new ArrayList<EventBoardDTO>();
		conn = getConnection();
		sql = " select * "
				+ " from ( select rownum rn, " + COLUMNS
				+ " 		from ( select * "
				+ "					from eventboard "
				+ "					where 1=1 " + condition
				+ "					order by board_num desc ) "
				+ " ) "
				+ " where rn between ? and ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				EventBoardDTO dto = new EventBoardDTO();
				dto.setBoardNum(rs.getLong("board_num"));
				dto.setAdminId(rs.getString("admin_id"));
				dto.setBoardName(rs.getString("board_name"));
				dto.setBoardPass(rs.getString("board_pass"));
				dto.setBoardSubject(rs.getString("board_subject"));
				dto.setBoardContent(rs.getString("board_content"));
				dto.setBoardDate(rs.getTimestamp("board_date"));
				dto.setIpAddr(rs.getString("ip_addr"));
				dto.setReadCount(rs.getLong("read_count"));
				dto.setStoreFileName(rs.getString("store_file_name"));
				dto.setStartDate(rs.getTimestamp("start_date"));
				dto.setEndDate(rs.getTimestamp("end_date"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	public int eventContentUpdate(EventBoardDTO dto) {
		int result = 0;
		conn = getConnection();
		sql = " update eventboard "
				+ " set board_subject = ?, board_content = ?, "
				+ " start_date = ?, end_date = ? "
				+ " where board_num = ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBoardSubject());
			pstmt.setString(2, dto.getBoardContent());
			pstmt.setTimestamp(3, dto.getStartDate());
			pstmt.setTimestamp(4, dto.getEndDate());
			pstmt.setLong(5, dto.getBoardNum());
			result = pstmt.executeUpdate();
			System.out.println(result + " 개의 이벤트 내용이 수정되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}

	public int eventFileUpdate(EventBoardDTO dto) {
		int result = 0;
		conn = getConnection();
		sql = "update eventboard "
				+ " set store_file_name = ? "
				+ " where board_num = ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getStoreFileName());
			pstmt.setLong(2, dto.getBoardNum());
			result = pstmt.executeUpdate();
			System.out.println(result + " 개의 이벤트 파일이 수정되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}

	public int eventDelete(String boardNum) {
		int result = 0;
		conn = getConnection();
		sql = "delete from eventboard where board_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNum);
			result = pstmt.executeUpdate();
			System.out.println(result + " 개의 이벤트가 삭제되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	
	
}
