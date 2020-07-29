package controller.main.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.GoodsOrderDAO;
import model.DTO.GoodsOrderDTOInsert;

public class OrderInsertAction {

	public void exeucte(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		GoodsOrderDAO dao = new GoodsOrderDAO();
		GoodsOrderDTOInsert dto = new GoodsOrderDTOInsert();
		
		HttpSession session = request.getSession();
		String userId = session.getAttribute("logId").toString();
		String [] bookName = request.getParameterValues("bookName");
		String [] bookNum = request.getParameterValues("bookNum");
		String [] bookCount = request.getParameterValues("bookCount");
		String [] partnerName = request.getParameterValues("partnerName");
		String [] bookPrice = request.getParameterValues("bookPrice");
		String userName = request.getParameter("userName");
		String userPh1 = request.getParameter("userPh1");
		String userEmail = request.getParameter("userEmail");
		String userAddr = request.getParameter("zip") + "-" + request.getParameter("addr1") + "-" + request.getParameter("addr2");
		String [] orderQty = request.getParameterValues("orderQty");
		
		String myPayMethod = request.getParameter("myPayMethod");
		String orderNum = Integer.toString(dao.goodsNumber());		
		
		dto.setUserId(userId);
		dto.setBookName(bookName);
		dto.setBookNum(bookNum);
		dto.setBookCount(bookCount);
		dto.setPartnerName(partnerName);
		dto.setBookPrice(bookPrice);
		dto.setUserName(userName);
		dto.setUserPh1(userPh1);
		dto.setUserEmail(userEmail);
		dto.setUserAddr(userAddr);
		dto.setOrderNum(orderNum);
		if (bookName.length > 1) {
			dto.setOrderName(bookName[0] + "외 " + bookName.length + "권");			
		} else {
			dto.setOrderName(bookName[0]);
		}
		dto.setOrderQty(orderQty);
		
		dao.goodsOrderInsert(dto);
		
		
	}
	
}
