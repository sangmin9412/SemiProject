package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.GoodsOrderDTO;

public class GoodsOrderDAO extends DataBaseInfo{
	final String COLUMNS = " book_name, book_num, book_count, partner_name, book_price, user_id, user_name, user_ph1, user_email, user_addr, order_name, order_num, order_delivery_num, order_return_num, order_cancel, order_date, order_qty, order_total_price ";
	
	public List<GoodsOrderDTO> goodsOrderSelect(int page, int limit, String orderNum){
		List<GoodsOrderDTO> list = new ArrayList<GoodsOrderDTO>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		String condition = "";
		if (orderNum != null) {
			condition = " and order_num = ?";
		}
		conn = getConnection();
		sql = " select * from ( select rownum rn, "+COLUMNS+" from ( select "+COLUMNS+" from goodsorder where 1=1 "+condition+" order by order_date desc )) where rn between ? and ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			if(orderNum != null) {
				pstmt.setString(1, orderNum);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}else {
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GoodsOrderDTO dto = new GoodsOrderDTO();
				dto.setBookName(rs.getString("book_name"));
				dto.setBookNum(rs.getString("book_num"));
				dto.setBookCount(rs.getString("book_count"));
				dto.setPartnerName(rs.getString("partner_name"));
				dto.setBookPrice(rs.getString("book_price"));
				dto.setUserId(rs.getString("user_id"));
				dto.setUserName(rs.getString("user_name"));
				dto.setUserPh1(rs.getString("user_ph1"));
				dto.setUserEmail(rs.getString("user_email"));
				dto.setUserAddr(rs.getString("user_addr"));
				dto.setOrderName(rs.getString("order_name"));
				dto.setOrderNum(rs.getString("order_num"));
				dto.setOrderDeliveryNum(rs.getString("order_delivery_num"));
				dto.setOrderReturnNum(rs.getString("order_return_num"));
				dto.setOrderCancel(rs.getString("order_cancel"));
				dto.setOrderDate(rs.getString("order_date"));
				dto.setOrderQty(rs.getString("order_qty"));
				dto.setOrderTotalPrice(rs.getString("order_total_price"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public Integer goodsOrderCount() {
		Integer result = 0;
		conn = getConnection();
		sql = "select count(*) from goodsorder ";
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
	
	public List<GoodsOrderDTO> goodsOrderListSelect(int page, int limit, String sortNum){
		List<GoodsOrderDTO> list = new ArrayList<GoodsOrderDTO>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		String condition = "";
		
		if (sortNum != null) {
			condition = " and order_delivery_num = ? ";
		}
		conn = getConnection();
		sql = " select * from ( select rownum rn, "+COLUMNS+" from ( select "+COLUMNS+" from goodsorder where 1=1 "+condition+" order by order_date desc )) where rn between ? and ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			if(sortNum != null) {
				pstmt.setString(1, sortNum);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}else {
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GoodsOrderDTO dto = new GoodsOrderDTO();
				dto.setBookName(rs.getString("book_name"));
				dto.setBookNum(rs.getString("book_num"));
				dto.setBookCount(rs.getString("book_count"));
				dto.setPartnerName(rs.getString("partner_name"));
				dto.setBookPrice(rs.getString("book_price"));
				dto.setUserId(rs.getString("user_id"));
				dto.setUserName(rs.getString("user_name"));
				dto.setUserPh1(rs.getString("user_ph1"));
				dto.setUserEmail(rs.getString("user_email"));
				dto.setUserAddr(rs.getString("user_addr"));
				dto.setOrderName(rs.getString("order_name"));
				dto.setOrderNum(rs.getString("order_num"));
				dto.setOrderDeliveryNum(rs.getString("order_delivery_num"));
				dto.setOrderReturnNum(rs.getString("order_return_num"));
				dto.setOrderCancel(rs.getString("order_cancel"));
				dto.setOrderDate(rs.getString("order_date"));
				dto.setOrderQty(rs.getString("order_qty"));
				dto.setOrderTotalPrice(rs.getString("order_total_price"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public List<GoodsOrderDTO> goodsOrderShipping(String orderNum) {
		List<GoodsOrderDTO> list = new ArrayList<GoodsOrderDTO>();
		conn = getConnection(); 
		sql = " update goodsorder set order_delivery_num=2 where order_num=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderNum);
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 배송처리 되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	
	
	
	
}
