package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.NoticeBoardDTO;

public class NoticeBoardDAO extends DataBaseInfo {
	final String COLUMNS = "board_num, admin_id, board_name, board_pass, board_subject, board_content, board_date, ip_addr, read_count";

	public void noticeInsert(NoticeBoardDTO dto) {
		conn = getConnection();
		sql = "insert into noticeboard ("+COLUMNS+") "
				+ " values (seq_notice.nextval, ?, null, null, ?, ?, sysdate, ?, 0)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getAdminId());
			pstmt.setString(2, dto.getBoardSubject());
			pstmt.setString(3, dto.getBoardContent());
			pstmt.setString(4, dto.getIpAddr());
			int i = pstmt.executeUpdate();
			System.out.println(i + " 개의 공지사항이 등록되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	public List<NoticeBoardDTO> noticeSelect(int page, int limit, String num) {
		List<NoticeBoardDTO> list = new ArrayList<NoticeBoardDTO>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		String condition = "";
		if (num != null) {
			condition = " and board_num = ? ";
		}
		
		conn = getConnection();
		sql = " select * "
		+ " from ( select rownum rn," + COLUMNS
		+ "			from ( select * from noticeboard "
		+ "					where 1=1 "+condition
		+ " 				order by board_num desc )"
		+ " ) "
		+ " where rn between ? and ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			if (num != null) {
				pstmt.setString(1, num);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			} else {
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeBoardDTO dto = new NoticeBoardDTO();
				dto.setBoardNum(rs.getLong("board_num"));
				dto.setAdminId(rs.getString("admin_id"));
				dto.setBoardSubject(rs.getString("board_subject"));
				dto.setBoardContent(rs.getString("board_content"));
				dto.setBoardDate(rs.getTimestamp("board_date"));
				dto.setIpAddr(rs.getString("ip_addr"));
				dto.setReadCount(rs.getLong("read_count"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}

	public void noticeDelete(String boardNum) {
		conn = getConnection();
		sql = "delete from noticeboard where board_num = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNum);
			int i = pstmt.executeUpdate();
			System.out.println(i + " 개의 공지사항이 삭제되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	public void noticeUpdate(NoticeBoardDTO dto) {
		conn = getConnection();
		sql = "update noticeboard "
				+ " set board_subject = ?, "
				+ " board_content = ? "
				+ " where board_num = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBoardSubject());
			pstmt.setString(2, dto.getBoardContent());
			pstmt.setLong(3, dto.getBoardNum());
			int i = pstmt.executeUpdate();
			System.out.println(i + " 개의 공지사항이 수정되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	
	
}
