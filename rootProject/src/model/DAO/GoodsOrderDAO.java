package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.GoodsOrderDTO;
import model.DTO.GoodsOrderDTOInsert;

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
	
	public List<GoodsOrderDTO> goodsOrderSelectView(int page, int limit, String orderNum, String bookName){
		List<GoodsOrderDTO> list = new ArrayList<GoodsOrderDTO>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		String condition = "";
		if (orderNum != null && bookName != null) {
			condition = " and order_num = ? and book_name = ? ";
		}
		conn = getConnection();
		sql = " select * from ( select rownum rn, "+COLUMNS+" from ( select "+COLUMNS+" from goodsorder where 1=1 "+condition+" order by order_date desc )) where rn between ? and ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			if(orderNum != null) {
				pstmt.setString(1, orderNum);
				pstmt.setString(2, bookName);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
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
	
	public List<GoodsOrderDTO> goodsOrderReturn(String orderNum, String bookName) {
		List<GoodsOrderDTO> list = new ArrayList<GoodsOrderDTO>();
		conn = getConnection(); 
		sql = " update goodsorder set order_return_num='02' where order_num=? and book_name=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderNum);
			pstmt.setString(2, bookName);
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 반품교환 처리 되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public int goodsNumber() {
		int result = 0;
		conn = getConnection();
		sql = "select seq_goodsorder.nextval as num from dual";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("num");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public void goodsOrderInsert(GoodsOrderDTOInsert dto) {
		conn = getConnection();
		sql = "insert into goodsorder ("+COLUMNS+") "
				+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '1', '00', null, sysdate, ?, ?) ";
		try {
			int i = 0;
			// int num = 1;
			for (String bn : dto.getBookNum()) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getBookName()[i]);
				pstmt.setString(2, dto.getBookNum()[i]);
				pstmt.setString(3, Integer.toString(Integer.parseInt(dto.getBookCount()[i]) - Integer.parseInt(dto.getOrderQty()[i])));
				pstmt.setString(4, dto.getPartnerName()[i]);
				pstmt.setString(5, dto.getBookPrice()[i]);
				pstmt.setString(6, dto.getUserId());
				pstmt.setString(7, dto.getUserName());
				pstmt.setString(8, dto.getUserPh1());
				pstmt.setString(9, dto.getUserEmail());
				pstmt.setString(10, dto.getUserAddr());
				pstmt.setString(11, dto.getOrderName());
				pstmt.setString(12, dto.getOrderNum());
				pstmt.setString(13, dto.getOrderQty()[i]);
				pstmt.setString(14, Integer.toString(Integer.parseInt(dto.getOrderQty()[i]) * Integer.parseInt(dto.getBookPrice()[i])));
				pstmt.executeUpdate();
				i++;
			}
			
			System.out.println(i + " 개의 주문정보가 등록되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	public List<GoodsOrderDTO> goodsOrderUserSelect(String userId) {
		List<GoodsOrderDTO> list = new ArrayList<GoodsOrderDTO>();
		conn = getConnection();
		sql = " select * from goodsorder where user_id = ? order by order_date desc ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
			
		return list;
	}

	public void goodsOrderCancelUpdate(String bookName, String orderNum, String orderQty) {
		conn = getConnection();
		sql = " update goodsorder set "
				+ " ORDER_CANCEL = 'Y', "
				+ " order_delivery_num = '4', "
				+ "	book_count = to_number(book_count) + ? "
				+ " where order_num = ? and book_name = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderQty);
			pstmt.setString(2, orderNum);
			pstmt.setString(3, bookName);
			int i = pstmt.executeUpdate();
			System.out.println(i + " 개의 주문취소가 완료되었습니다");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void goodsOrderReturnUpdate(String bookName, String orderNum, String returnSort, String orderQty) {
		String condition = "";
		if (returnSort.equals("반품")) {
			condition = "01";				
		} else if (returnSort.equals("교환")) {
			condition = "11";
		}
		conn = getConnection();
		sql = " update goodsorder set "
				+ " ORDER_RETURN_NUM = ?,"
				+ " order_delivery_num = '5', "
				+ "	book_count = to_number(book_count) + ? "
				+ " where order_num = ? and book_name = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, condition);
			pstmt.setString(2, orderQty);
			pstmt.setString(3, orderNum);
			pstmt.setString(4, bookName);
			int i = pstmt.executeUpdate();
			System.out.println(i + " 개의 반품/교환이 완료되었습니다");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void goodsCountUpdateMinus(GoodsOrderDTOInsert dto) {
		conn = getConnection();
		sql = " update goods set "
				+ " book_count = to_number(book_count) - ? "
				+ " where book_num = ? ";
		try {
			int i = 0;
			for (String bn : dto.getBookNum()) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getOrderQty()[i]);
				pstmt.setString(2, bn);
				pstmt.executeUpdate();
				i++;
			}
			
			System.out.println(i + " 개의 상품재고가 수정되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	
	public void goodsCountUpdatePlus(String bookNum, String orderQty) {
		conn = getConnection();
		sql = " update goods set "
				+ "	book_count = to_number(book_count) + ? "
				+ " where book_num = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderQty);
			pstmt.setString(2, bookNum);
			int i = pstmt.executeUpdate();
			System.out.println(i + " 개의 상품재고가 수정되었습니다");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	public List<GoodsOrderDTO> goodsOrderPartnerSelect(int page, int limit, String partnerName) {
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		List<GoodsOrderDTO> list = new ArrayList<GoodsOrderDTO>();
		conn = getConnection();
		sql = " select * "
				+ " from ( select rownum rn, " + COLUMNS
				+ "			from ( select " + COLUMNS
				+ "					 from goodsorder"
				+ "					where partner_name = ? "
				+ "					order by order_date desc ) "
				+ " ) where rn between ? and ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, partnerName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
			
		return list;
	}
	
	public Integer goodsOrderPartnerCount(String partnerName) {
		Integer result = 0;
		conn = getConnection();
		sql = "select count(*) from goodsorder where partner_name = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, partnerName);
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
