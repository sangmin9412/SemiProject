package model.DAO;

import java.util.ArrayList;
import java.util.List;

import model.DTO.PartnerDTO;

public class PartnerDAO extends DataBaseInfo{
	final String COLUMNS = " partner_name, partner_num, partner_ceo, resident_num, partner_addr, opening_day, business_regist_date, sales_type, business_type, cooperative, book_info, business_Regist_file, bank_book_file, partner_acc_num, partner_pw, partner_regist_date, join_ok, partner_Email ";
	
	public void partnerInsert(PartnerDTO dto) {
		conn = getConnection();
		sql = " insert into partner ("+ COLUMNS +") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPartnerName());
			pstmt.setString(2, dto.getPartnerNum());
			pstmt.setString(3, dto.getPartnerCeo());
			pstmt.setString(4, dto.getResidentNum());
			pstmt.setString(5, dto.getPartnerAddr());
			pstmt.setTimestamp(6, dto.getOpeningDay());
			pstmt.setTimestamp(7, dto.getBusinessRegistDate());
			pstmt.setString(8, dto.getSalesType());
			pstmt.setString(9, dto.getBusinessType());
			pstmt.setString(10, dto.getCooperative());
			pstmt.setString(11, dto.getBookInfo());
			pstmt.setString(12, dto.getBusinessRegistFile());
			pstmt.setString(13, dto.getBankBookFile());
			pstmt.setString(14, dto.getPartnerAccNum());
			pstmt.setString(15, "1234");
			pstmt.setString(16, null);
			pstmt.setString(17, dto.getPartnerEmail());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 저장되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}	
	}
	
	public Integer partnerCount() {
		Integer result = 0;
		conn = getConnection();
		sql = "select count(*) from partner ";
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
	
	public List<PartnerDTO> partnerSelect(int page, int limit, String partnerNum){
		List<PartnerDTO> list = new ArrayList<PartnerDTO>();
		int startRow = (page - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		String condition = "";
		if(partnerNum != null) condition = " and partner_num = ?";
		conn = getConnection();
		sql = "select * from (select rownum rn, "+COLUMNS+" from (select "+COLUMNS+" from partner where 1=1 "+condition+" order by partner_regist_date desc)) where rn between ? and ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			if(partnerNum != null) {
				pstmt.setString(1,  partnerNum);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}else {
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PartnerDTO dto = new PartnerDTO();
				dto.setPartnerName(rs.getString("partner_name"));
				dto.setPartnerNum(rs.getString("partner_num"));
				dto.setPartnerCeo(rs.getString("partner_ceo"));
				dto.setResidentNum(rs.getString("resident_num"));
				dto.setPartnerAddr(rs.getString("partner_addr"));
				dto.setOpeningDay(rs.getTimestamp("opening_day"));
				dto.setBusinessRegistDate(rs.getTimestamp("business_regist_date"));
				dto.setSalesType(rs.getString("sales_type"));
				dto.setBusinessType(rs.getString("business_type"));
				dto.setCooperative(rs.getString("cooperative"));
				dto.setBookInfo(rs.getString("book_info"));
				dto.setBusinessRegistFile(rs.getString("business_Regist_file"));
				dto.setBankBookFile(rs.getString("bank_book_file"));
				dto.setPartnerAccNum(rs.getString("partner_acc_num"));
				dto.setPartnerPw(rs.getString("partner_pw"));
				dto.setPartnerRegistDate(rs.getTimestamp("partner_regist_date"));
				dto.setJoinOk(rs.getString("JOIN_OK"));
				dto.setPartnerEmail(rs.getString("partner_email"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public Integer partnerDel(String partnerNum) {
		Integer i = 0;
		conn = getConnection();
		sql = "delete from partner where partner_num=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, partnerNum);
			i = pstmt.executeUpdate();
			System.out.println(i + "개가 삭제 되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return i;
	}
	
	public void PartnerUpdate(PartnerDTO dto) {
		conn = getConnection();
		sql = " update partner set partner_name=?, partner_num=?, partner_ceo=?, resident_num=?, partner_addr=?, opening_day=?, business_regist_date=?, sales_type=?, business_type=?, cooperative=?, book_info=?, partner_acc_num=?, partner_pw=?, partner_Email=? where partner_num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPartnerName());
			pstmt.setString(2, dto.getPartnerNum());
			pstmt.setString(3, dto.getPartnerCeo());
			pstmt.setString(4, dto.getResidentNum());
			pstmt.setString(5, dto.getPartnerAddr());
			pstmt.setTimestamp(6, dto.getOpeningDay());
			pstmt.setTimestamp(7, dto.getBusinessRegistDate());
			pstmt.setString(8, dto.getSalesType());
			pstmt.setString(9, dto.getBusinessType());
			pstmt.setString(10, dto.getCooperative());
			pstmt.setString(11, dto.getBookInfo());
			pstmt.setString(12, dto.getPartnerAccNum());
			pstmt.setString(13, dto.getPartnerPw());
			pstmt.setString(14, dto.getPartnerEmail());
			pstmt.setString(15, dto.getPartnerNum());
			int i = pstmt.executeUpdate();
			System.out.println(i + "개가 수정되었습니다.");
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public Integer fileUpdate(PartnerDTO dto) {
		Integer i = 0;
		conn = getConnection();
		sql = " update partner set business_Regist_file =?, bank_book_file =? where partner_num=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBusinessRegistFile());
			pstmt.setString(2, dto.getBankBookFile());
			pstmt.setString(3, dto.getPartnerNum());
			i = pstmt.executeUpdate();
			System.out.println(i + "개가 수정되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			close();
		} 
		return i;
	}
	
	
	
	
}
