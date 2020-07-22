package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.FaqBoardDTO;

public class FaqBoardDAO extends DataBaseInfo {
	final String COLUMNS = "board_num, admin_id, board_name, board_pass, board_subject, board_content, board_date, ip_addr, read_count";

	public void faqInsert(FaqBoardDTO dto) {
		conn = getConnection();
		sql = "insert into faqboard ("+COLUMNS+") "
				+ " values (seq_faq.nextval, ?, null, null, ?, ?, sysdate, ?, 0)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getAdminId());
			pstmt.setString(2, dto.getBoardSubject());
			pstmt.setString(3, dto.getBoardContent());
			pstmt.setString(4, dto.getIpAddr());
			int i = pstmt.executeUpdate();
			System.out.println(i + " 개의 Faq가 등록되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	public List<FaqBoardDTO> faqSelect(int page, int limit, String num) {
		List<FaqBoardDTO> list = new ArrayList<FaqBoardDTO>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		String condition = "";
		if (num != null) {
			condition = " and board_num = ? ";
		}
		
		conn = getConnection();
		sql = " select * "
		+ " from ( select rownum rn," + COLUMNS
		+ "			from ( select * from faqboard "
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
				FaqBoardDTO dto = new FaqBoardDTO();
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

	public void faqDelete(String boardNum) {
		conn = getConnection();
		sql = "delete from faqboard where board_num = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardNum);
			int i = pstmt.executeUpdate();
			System.out.println(i + " 개의 Faq가 삭제되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	public void faqUpdate(FaqBoardDTO dto) {
		conn = getConnection();
		sql = "update faqboard "
				+ " set board_subject = ?, "
				+ " board_content = ? "
				+ " where board_num = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBoardSubject());
			pstmt.setString(2, dto.getBoardContent());
			pstmt.setLong(3, dto.getBoardNum());
			int i = pstmt.executeUpdate();
			System.out.println(i + " 개의 Faq가 수정되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	
}
