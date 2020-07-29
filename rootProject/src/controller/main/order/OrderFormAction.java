package controller.main.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.GoodsDAO;
import model.DAO.MemberDAO;
import model.DTO.CartDTO;
import model.DTO.GoodsDTO;
import model.DTO.MemberDTO;

public class OrderFormAction {

	public void exeucte(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		GoodsDAO goodsDao = new GoodsDAO();
		MemberDAO memberDao = new MemberDAO();
		
		HttpSession session = request.getSession();
		String userId = session.getAttribute("logId").toString();
		String bookNum = request.getParameter("bookNum");
		int tp = 0;
		
		if (request.getParameter("bookNum") != null) {
			String qty = request.getParameter("Qty");
			List<GoodsDTO> goodsList = goodsDao.goodsSelect(1, 1, bookNum);
			request.setAttribute("goodsList", goodsList);
			request.setAttribute("qty", qty);
		} else {
			
			List<CartDTO> goodsList = goodsDao.cartAllSelect(userId);
			request.setAttribute("goodsList", goodsList);
			/*
			for (CartDTO cartDTO : goodsList) {
				tp += Integer.parseInt(cartDTO.getTotalPrice());
			}
			request.setAttribute("tp", tp);
			*/
		}
		
		
		List<MemberDTO> memberList = memberDao.memberSelect(1, 1, userId);
		request.setAttribute("memberList", memberList.get(0));
		
	}
	
}
