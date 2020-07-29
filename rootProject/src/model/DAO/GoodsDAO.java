package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.CartDTO;
import model.DTO.GoodsDTO;

public class GoodsDAO extends DataBaseInfo{
	final String COLUMNS = " book_isbn, book_name, book_author_name, book_category, partner_name, book_date, book_price, book_page_num, book_length, book_sub, book_image, book_intro, book_author_intro, book_list, book_count, book_regist, partner_num, book_num ";
	/* 
	 * goods 테이블정보도 같이 갖고 오려고 조인 해봤는데 혹시 에러나면 수정하시거나
	 * 
	 *  final String CART_COLUMNS, 
	 *  public List<CartDTO> cartAllSelect 
	 *  
	 *  여기 두군데 적용되어있는 코드 지우고 주석되있는거 푸시고 
	 *  member_mypage.jsp, order_step_01.jsp 에 bookCategory 불러오는부분 지우시면 되요
	 *  
	 */
	// final String CART_COLUMNS = " CART_NUM, BOOK_NUM, USER_ID, BOOK_NAME, BOOK_PRICE, BOOK_IMAGE, BOOK_QTY, book_count, partner_name, TOTAL_PRICE, sum_total_price ";
	final String CART_COLUMNS = " c.CART_NUM, c.BOOK_NUM, c.USER_ID, c.BOOK_NAME, c.BOOK_PRICE, c.BOOK_IMAGE, c.BOOK_QTY, c.book_count, c.partner_name, c.TOTAL_PRICE, c.sum_total_price ";
	
	
	public void goodsInsert(GoodsDTO dto) {
		conn = getConnection();
		sql = " insert into goods (" +COLUMNS+ ") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,?,(select nvl(max(to_number(book_num)),0)+1 from goods))";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBookIsbn());
			pstmt.setString(2, dto.getBookName());
			pstmt.setString(3, dto.getBookAuthorName());
			pstmt.setString(4, dto.getBookCategory());
			pstmt.setString(5, dto.getPartnerName());
			pstmt.setTimestamp(6, dto.getBookDate());
			pstmt.setString(7, dto.getBookPrice());
			pstmt.setString(8, dto.getBookPageNum());
			pstmt.setString(9, dto.getBookLength());
			pstmt.setString(10, dto.getBookSub());
			pstmt.setString(11, dto.getBookImage());
			pstmt.setString(12, dto.getBookIntro());
			pstmt.setString(13, dto.getBookAuthorIntro());
			pstmt.setString(14, dto.getBookList());
			pstmt.setString(15, "20");
			pstmt.setString(16, dto.getPartnerNum());
//			pstmt.setString(17, dto.getBookNum());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 저장되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public List<GoodsDTO> goodsSelect(int page, int limit, String bookNum) {
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		String condition = "";
		if (bookNum != null) {
			condition = " and book_num = ?";
		}
		conn = getConnection();
		sql = " select * from ( select rownum rn, "+COLUMNS+" from ( select "+COLUMNS+" from goods where 1=1 "+condition+" order by book_regist desc )) where rn between ? and ? ";
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
				GoodsDTO dto = new GoodsDTO();
				dto.setBookIsbn(rs.getString("book_isbn"));
				dto.setBookName(rs.getString("book_name"));
				dto.setBookAuthorName(rs.getString("book_author_name"));
				dto.setBookCategory(rs.getString("book_category"));
				dto.setPartnerName(rs.getString("partner_name"));
				dto.setBookDate(rs.getTimestamp("book_date"));
				dto.setBookPrice(rs.getString("book_price"));
				dto.setBookPageNum(rs.getString("book_page_num"));
				dto.setBookLength(rs.getString("book_length"));
				dto.setBookSub(rs.getString("book_sub"));
				dto.setBookImage(rs.getString("book_image"));
				dto.setBookIntro(rs.getString("book_intro"));
				dto.setBookAuthorIntro(rs.getString("book_author_intro"));
				dto.setBookList(rs.getString("book_list"));
				dto.setBookCount(rs.getString("book_count"));
				dto.setBookRegist(rs.getTimestamp("book_regist"));
				dto.setPartnerNum(rs.getString("partner_num"));
				dto.setBookNum(rs.getString("book_num"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public List<GoodsDTO> goodsCategorySelect(int page, int limit, String bookCategory) {
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		conn = getConnection();
		sql = " select * from ( select rownum rn, "+COLUMNS+" from ( select "+COLUMNS+" from goods where BOOK_CATEGORY = ? order by book_regist desc )) where rn between ? and ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookCategory);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GoodsDTO dto = new GoodsDTO();
				dto.setBookIsbn(rs.getString("book_isbn"));
				dto.setBookName(rs.getString("book_name"));
				dto.setBookAuthorName(rs.getString("book_author_name"));
				dto.setBookCategory(rs.getString("book_category"));
				dto.setPartnerName(rs.getString("partner_name"));
				dto.setBookDate(rs.getTimestamp("book_date"));
				dto.setBookPrice(rs.getString("book_price"));
				dto.setBookPageNum(rs.getString("book_page_num"));
				dto.setBookLength(rs.getString("book_length"));
				dto.setBookSub(rs.getString("book_sub"));
				dto.setBookImage(rs.getString("book_image"));
				dto.setBookIntro(rs.getString("book_intro"));
				dto.setBookAuthorIntro(rs.getString("book_author_intro"));
				dto.setBookList(rs.getString("book_list"));
				dto.setBookCount(rs.getString("book_count"));
				dto.setBookRegist(rs.getTimestamp("book_regist"));
				dto.setPartnerNum(rs.getString("partner_num"));
				dto.setBookNum(rs.getString("book_num"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public Integer goodsPartnerCount(String partnerNum) {
		Integer result = 0;
		conn = getConnection();
		sql = "select count(*) from goods where partner_num = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, partnerNum);
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
	
	public Integer goodsCount() {
		Integer result = 0;
		conn = getConnection();
		sql = "select count(*) from goods ";
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
	
	public Integer goodsCategoryCount(String bookCategory) {
		Integer result = 0;
		conn = getConnection();
		sql = "select count(*) from goods where BOOK_CATEGORY = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookCategory);
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
	
	public void GoodsUpdate(GoodsDTO dto) {
		conn = getConnection();
		sql = " update goods set book_isbn=?, book_name=?, book_author_name=?, book_category=?, partner_name=?, book_date=?, book_price=?, book_page_num=?, book_length=?, book_sub=?, book_intro=?, book_author_intro=?, book_list=?, book_count=? where book_num=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBookIsbn());
			pstmt.setString(2, dto.getBookName());
			pstmt.setString(3, dto.getBookAuthorName());
			pstmt.setString(4, dto.getBookCategory());
			pstmt.setString(5, dto.getPartnerName());
			pstmt.setTimestamp(6, dto.getBookDate());
			pstmt.setString(7, dto.getBookPrice());
			pstmt.setString(8, dto.getBookPageNum());
			pstmt.setString(9, dto.getBookLength());
			pstmt.setString(10, dto.getBookSub());
			// pstmt.setString(11, dto.getBookImage());
			pstmt.setString(11, dto.getBookIntro());
			pstmt.setString(12, dto.getBookAuthorIntro());
			pstmt.setString(13, dto.getBookList());
			pstmt.setString(14, dto.getBookCount());
			pstmt.setString(15, dto.getBookNum());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 수정되었습니다.");
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public Integer fileUpdate(GoodsDTO dto) {
		Integer i = 0;
		conn = getConnection();
		sql = " update goods set book_image=? where book_num=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBookImage());
			pstmt.setString(2, dto.getBookNum());
			i = pstmt.executeUpdate();
			System.out.println(i + "개가 수정되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return i;
	}

	public List<GoodsDTO> goodsPartnerSelect(int page, int limit, String bookNum, String partnerNum) {
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		String condition = "";
		if(bookNum != null) condition = " and book_num = ?";
		conn = getConnection();
		sql = " select * from ( select rownum rn, "+COLUMNS+" from ( select "+COLUMNS+" from goods where partner_num = ? "+condition+" order by book_regist desc )) where rn between ? and ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			if(bookNum != null) {
				pstmt.setString(1, bookNum);
				pstmt.setString(2, partnerNum);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			}else {
				pstmt.setString(1, partnerNum);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GoodsDTO dto = new GoodsDTO();
				dto.setBookIsbn(rs.getString("book_isbn"));
				dto.setBookName(rs.getString("book_name"));
				dto.setBookAuthorName(rs.getString("book_author_name"));
				dto.setBookCategory(rs.getString("book_category"));
				dto.setPartnerName(rs.getString("partner_name"));
				dto.setBookDate(rs.getTimestamp("book_date"));
				dto.setBookPrice(rs.getString("book_price"));
				dto.setBookPageNum(rs.getString("book_page_num"));
				dto.setBookLength(rs.getString("book_length"));
				dto.setBookSub(rs.getString("book_sub"));
				dto.setBookImage(rs.getString("book_image"));
				dto.setBookIntro(rs.getString("book_intro"));
				dto.setBookAuthorIntro(rs.getString("book_author_intro"));
				dto.setBookList(rs.getString("book_list"));
				dto.setBookCount(rs.getString("book_count"));
				dto.setBookRegist(rs.getTimestamp("book_regist"));
				dto.setPartnerNum(rs.getString("partner_num"));
				dto.setBookNum(rs.getString("book_num"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}

	public int goodsDelete(String partnerNum, String bookNum) {
		int result = 0;
		conn = getConnection();
		sql = "delete from goods where partner_num = ? and book_num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, partnerNum);
			pstmt.setString(2, bookNum);
			result = pstmt.executeUpdate();
			System.out.println(result + " 개의 상품이 삭제되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	
	public void goodsIpgoPtOk(String pOrderNum, String partnerNum) {
		conn = getConnection();
		sql = " update partnerorder set "
				+ " p_order_chk = 1 "
				+ " where p_order_num = ? and partner_num = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pOrderNum);
			pstmt.setString(2, partnerNum);
			int i = pstmt.executeUpdate();
			System.out.println(i + " 개의 발주가 완료되었습니다. - 출판사");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	public void goodsIpgoOk(String pOrderNum) {
		conn = getConnection();
		sql = " update partnerorder set "
				+ " p_order_chk = 2 "
				+ " where p_order_num = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pOrderNum);
			int i = pstmt.executeUpdate();
			System.out.println(i + " 개의 입하가 완료되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	
	public void goodsIpgoReOk(String pOrderNum) {
		conn = getConnection();
		sql = " update partnerorder set "
				+ " p_order_chk = 3 "
				+ " where p_order_num = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pOrderNum);
			int i = pstmt.executeUpdate();
			System.out.println(i + " 개의 반품이 완료되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public List<GoodsDTO> goodsListPartnerSelect(int page, int limit, String partnerName , String serchValue) {
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		String condition = "";
		if(!serchValue.equals("")) { condition = " and book_name like ? ";}
			conn = getConnection();
			sql = " select * from ( select rownum rn, " + COLUMNS + " from ( select " + COLUMNS + " from goods where 1=1 and partner_name = ? " + condition + " order by book_regist desc )) where rn between ? and ? ";
			try {
				pstmt = conn.prepareStatement(sql);
				if(!serchValue.equals("")) {
					pstmt.setString(1, partnerName);
					pstmt.setString(2, "%"+serchValue+"%");
					pstmt.setInt(3, startRow);
					pstmt.setInt(4, endRow);
				}else {
					pstmt.setString(1, partnerName);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
				}

				rs = pstmt.executeQuery();
				while(rs.next()) {
					GoodsDTO dto = new GoodsDTO();
					dto.setBookIsbn(rs.getString("book_isbn"));
					dto.setBookName(rs.getString("book_name"));
					dto.setBookAuthorName(rs.getString("book_author_name"));
					dto.setBookCategory(rs.getString("book_category"));
					dto.setPartnerName(rs.getString("partner_name"));
					dto.setBookDate(rs.getTimestamp("book_date"));
					dto.setBookPrice(rs.getString("book_price"));
					dto.setBookPageNum(rs.getString("book_page_num"));
					dto.setBookLength(rs.getString("book_length"));
					dto.setBookSub(rs.getString("book_sub"));
					dto.setBookImage(rs.getString("book_image"));
					dto.setBookIntro(rs.getString("book_intro"));
					dto.setBookAuthorIntro(rs.getString("book_author_intro"));
					dto.setBookList(rs.getString("book_list"));
					dto.setBookCount(rs.getString("book_count"));
					dto.setBookRegist(rs.getTimestamp("book_regist"));
					dto.setPartnerNum(rs.getString("partner_num"));
					dto.setBookNum(rs.getString("book_num"));
					list.add(dto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
			close();
			}
		return list;
	}

	public List<GoodsDTO> goodsPnameSelect() {
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		conn = getConnection();
		sql = " select partner_name from partner";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GoodsDTO dto = new GoodsDTO();
				dto.setPartnerName(rs.getString("partner_name"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		close();
		}
		return list;
	}
	
	public void goodsCartAdd(List<GoodsDTO> list, String userId, String Qty) {
		conn = getConnection();
		sql = " merge into cart c using (select book_num from goods where book_num=?) g"
				+ " on (c.book_num = g.book_num and c.user_id=?) "
				+ " when matched "
				+ "		then update set book_qty = book_qty + 1, total_price = (book_qty + 1) * book_price"
				+ " when not matched then"
				+ " 	insert (c.cart_num, c.book_num, c.user_id, c.book_name, c.book_price, c.book_image, c.book_qty, c.total_price, c.partner_name, c.book_count)"
				+ " values ((select nvl(max(to_number(cart_num)),0)+1 from cart), ?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, list.get(0).getBookNum());
			pstmt.setString(2, userId);
			pstmt.setString(3, list.get(0).getBookNum());
			pstmt.setString(4, userId);
			pstmt.setString(5, list.get(0).getBookName());
			pstmt.setString(6, list.get(0).getBookPrice());
			pstmt.setString(7, list.get(0).getBookImage());
			pstmt.setString(8, Qty);
			pstmt.setString(9, Integer.toString(Integer.parseInt(list.get(0).getBookPrice()) * Integer.parseInt(Qty)));
			pstmt.setString(10, list.get(0).getPartnerName());
			pstmt.setString(11, list.get(0).getBookCount());
			int i = pstmt.executeUpdate();
			System.out.println(i +"가 변경되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public List<CartDTO> cartAllSelect(String userId){
		List<CartDTO> list = new ArrayList<CartDTO>();
		conn = getConnection(); 
		/*
		sql = "select " + CART_COLUMNS+ ",  "
			+ " sum(total_price) over (partition by user_id) as sum_total_price"
			+ " from cart "
			+ " where user_id = ?";
		*/
		sql = "select " + CART_COLUMNS+ ",  "
				+ " sum(c.total_price) over (partition by c.user_id) as sum_price, "
				+ " g.book_category "
				+ " from goods g, cart c "
				+ " where g.book_num = c.book_num and c.user_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				/*
				dto.setCartNum(rs.getString("CART_NUM"));
				dto.setBookNum(rs.getString("BOOK_NUM"));
				dto.setUserId(rs.getString("USER_ID"));
				dto.setBookName(rs.getString("BOOK_NAME"));
				dto.setBookPrice(rs.getString("BOOK_PRICE"));
				dto.setBookImage(rs.getString("BOOK_IMAGE"));
				dto.setBookQty(rs.getString("BOOK_QTY"));
				dto.setTotalPrice(rs.getString("TOTAL_PRICE"));
				dto.setPartnerName(rs.getString("partner_name"));
				dto.setSumTotalPrice(rs.getString("sum_total_price"));
				dto.setBookCount(rs.getString("book_count"));
				*/
				dto.setCartNum(rs.getString("CART_NUM"));
				dto.setBookNum(rs.getString("BOOK_NUM"));
				dto.setUserId(rs.getString("USER_ID"));
				dto.setBookName(rs.getString("BOOK_NAME"));
				dto.setBookPrice(rs.getString("BOOK_PRICE"));
				dto.setBookImage(rs.getString("BOOK_IMAGE"));
				dto.setBookQty(rs.getString("BOOK_QTY"));
				dto.setTotalPrice(rs.getString("TOTAL_PRICE"));
				dto.setPartnerName(rs.getString("partner_name"));
				dto.setSumTotalPrice(rs.getString("sum_price"));
				dto.setBookCount(rs.getString("book_count"));
				dto.setBookCategory(rs.getString("book_category"));
				list.add(dto);
			}
		}catch(Exception e) {e.printStackTrace();}
		finally {close();}
		return list;
	}
	
	public void cartQtyDown(String bookNum, String userId) {
		conn = getConnection(); 
		sql = " update cart "
			+ " set book_qty = book_qty - 1,"
			+ "     total_Price = (book_qty -1) * book_price "
			+ " where book_num =? and user_id = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookNum);
			pstmt.setString(2, userId);
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 수정되었습니다.");
		}catch(Exception e) {e.printStackTrace();}
		finally {close();}
	}
	
	public void cartRemove(String [] cartNums) {
		conn = getConnection(); 
		sql = "delete from cart "
			+ " where cart_num = ? ";
		try {
			int j = 0;
			pstmt = conn.prepareStatement(sql);
			for(String cartNum : cartNums) {
				pstmt.setString(1, cartNum);
				int i = pstmt.executeUpdate();
				if( i > 0) { j++; }
			}
			System.out.println(j + "개가 삭제되었습니다.");
		}catch(Exception e) {e.printStackTrace();}
		finally {close();}
	}
	
	
	
	
}
