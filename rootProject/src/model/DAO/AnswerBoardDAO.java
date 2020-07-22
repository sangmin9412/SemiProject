package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.AnswerBoardDTO;

public class AnswerBoardDAO extends DataBaseInfo {
	final String COLUMNS = "BOARD_NUM, USER_ID, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT, BOARD_DATE, IP_ADDR, READ_COUNT, ORIGINAL_FILE_NAME, STORE_FILE_NAME, FILE_SIZE, BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ";

	public void answerInsert(AnswerBoardDTO dto) {
		conn = getConnection();
		sql = "insert into answerboard ("+COLUMNS+") "
				+ " values (SEQ_ANSWER.nextval, ?, ?, ?, ?, ?, sysdate, ?, 0, ?, ?, ?, SEQ_ANSWER.currval, 0, 0) ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, null);
			pstmt.setString(3, dto.getBoardPass());
			pstmt.setString(4, dto.getBoardSubject());
			pstmt.setString(5, dto.getBoardContent());
			pstmt.setString(6, dto.getIpAddr());
			pstmt.setString(7, dto.getOriginalFileName());
			pstmt.setString(8, dto.getStoreFileName());
			pstmt.setLong(9, dto.getFileSize());
			int i = pstmt.executeUpdate();
			System.out.println(i + " 개의 1:1문의가 작성되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	
	public List<AnswerBoardDTO> ansSelectAll(int page, int limit, String num) {
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		String condition = "";
		if (num != null) {
			condition = " and board_num = " + num;
		}
		List<AnswerBoardDTO> list = new ArrayList<AnswerBoardDTO>();
		// sql = "select * from answerboard where 1=1 " + condition;
		sql = " select * "
				+ " from ( select rownum rn, " + COLUMNS
				+ " 		from ( select " + COLUMNS + " from answerboard "
				+ " 				where 1=1" + condition
				+ " 				order by board_re_ref desc, board_re_seq asc ) "
				+ " ) "
				+ " where rn between ? and ? ";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AnswerBoardDTO dto = new AnswerBoardDTO();
				dto.setBoardNum(rs.getLong("board_num"));
				dto.setUserId(rs.getString("user_id"));
				dto.setBoardName(rs.getString("board_name"));
				dto.setBoardPass(rs.getString("board_pass"));
				dto.setBoardSubject(rs.getString("board_subject"));
				dto.setBoardContent(rs.getString("board_content"));
				dto.setBoardDate(rs.getTimestamp("board_date"));
				dto.setIpAddr(rs.getString("ip_addr"));
				dto.setReadCount(rs.getLong("read_count"));
				dto.setOriginalFileName(rs.getString("original_file_name"));
				dto.setStoreFileName(rs.getString("store_file_name"));
				dto.setFileSize(rs.getLong("file_size"));
				dto.setBoardReRef(rs.getInt("board_re_ref"));
				dto.setBoardReLev(rs.getInt("board_re_lev"));
				dto.setBoardReSeq(rs.getInt("board_re_seq"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	
}
