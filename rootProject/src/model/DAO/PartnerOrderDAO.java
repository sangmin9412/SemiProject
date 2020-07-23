package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.GoodsDTO;
import model.DTO.PartnerOrderDTO;

public class PartnerOrderDAO extends DataBaseInfo{
	final String COLUMNS = " partner_name, partner_num, book_name, book_num, book_count, p_order_num, p_order_qty, p_order_date, p_order_re_qty, p_order_re_date, p_order_ok_qty, p_order_ok_date, p_order_chk ";
	
	
	public void pOrderInsert(PartnerOrderDTO dto) {
		conn = getConnection();
		sql = " insert into partnerorder (" +COLUMNS+ ") values(?, ?, ?, ?, ?, (select nvl(max(to_number(p_order_num)),0)+1 from partnerorder), ?, sysdate, null, null, null, null, ? ) ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPartnerName());
			pstmt.setString(2, dto.getPartnerNum());
			pstmt.setString(3, dto.getBookName());
			pstmt.setString(4, dto.getBookNum());
			pstmt.setString(5, dto.getBookCount());
			pstmt.setString(6, dto.getpOrderQty());
			pstmt.setString(7, "0");
			int i = pstmt.executeUpdate();
			System.out.println(i + "항목이 발주되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public List<PartnerOrderDTO> partnerIbgoSelect(int page, int limit, String bookNum){
		List<PartnerOrderDTO> list = new ArrayList<PartnerOrderDTO>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		String condition = "";
		if(bookNum != null) condition = " and book_num = ?";
		conn = getConnection();
		sql = " select * from ( select rownum rn, " +COLUMNS+ " from ( select " +COLUMNS+ " from partnerorder where 1=1 " +condition+ " order by p_order_date desc )) where rn between ? and ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			if(bookNum != null) {
				pstmt.setString(1, bookNum);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}else {
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PartnerOrderDTO dto = new PartnerOrderDTO();
				dto.setPartnerName(rs.getString("partner_name"));
				dto.setPartnerNum(rs.getString("partner_num"));
				dto.setBookName(rs.getString("book_name"));
				dto.setBookNum(rs.getString("book_num"));
				dto.setBookCount(rs.getString("book_count"));
				dto.setpOrderNum(rs.getString("p_order_num"));
				dto.setpOrderQty(rs.getString("p_order_qty"));
				dto.setpOrderDate(rs.getTimestamp("p_order_date"));
				dto.setpOrderReQty(rs.getString("p_order_re_qty"));
				dto.setpOrderReDate(rs.getTimestamp("p_order_re_date"));
				dto.setpOrderOkQty(rs.getString("p_order_ok_qty"));
				dto.setpOrderOkDate(rs.getTimestamp("p_order_ok_date"));
				dto.setpOrderChk(rs.getString("p_order_chk"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public Integer partnerIbgoCount() {
		Integer result = 0;
		conn = getConnection();
		sql = "select count(*) from partnerorder ";
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
	
	public void pOrderReOkInsert(PartnerOrderDTO dto) {
		conn = getConnection();
		sql = " insert into partnerorder (" +COLUMNS+ ") values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, null, ? ) ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPartnerName());
			pstmt.setString(2, dto.getPartnerNum());
			pstmt.setString(3, dto.getBookName());
			pstmt.setString(4, dto.getBookNum());
			pstmt.setString(5, dto.getBookCount());
			pstmt.setString(6, dto.getpOrderNum());
			pstmt.setString(7, dto.getpOrderQty());
			pstmt.setTimestamp(8,  dto.getpOrderDate());
			pstmt.setString(9, dto.getpOrderReQty());
			pstmt.setTimestamp(10, dto.getpOrderReDate());
			pstmt.setNString(11,  dto.getpOrderOkQty());
			pstmt.setString(12, "0");
			
			int i = pstmt.executeUpdate();
			System.out.println(i + "항목이 반품 입하되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		
	}
	
	
	
}
