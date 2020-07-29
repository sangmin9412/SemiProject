package controller.main.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.GoodsDAO;
import model.DAO.MemberDAO;
import model.DTO.GoodsDTO;
import model.DTO.MemberDTO;

public class OrderFormAction_bak {

	public void exeucte(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		String userId = session.getAttribute("logId").toString();
		String bookNum = request.getParameter("bookNum");
		String qty = request.getParameter("Qty");
		
		GoodsDAO goodsDao = new GoodsDAO();
		MemberDAO memberDao = new MemberDAO();
		
		List<GoodsDTO> goodsList = goodsDao.goodsSelect(1, 1, bookNum);
		List<MemberDTO> memberList = memberDao.memberSelect(1, 1, userId);
		
		request.setAttribute("goodsList", goodsList.get(0));
		request.setAttribute("memberList", memberList.get(0));
		request.setAttribute("Qty", qty);
		
		int price = (Integer.parseInt(qty)) * (Integer.parseInt(goodsList.get(0).getBookPrice()));
		request.setAttribute("price", price);
		
		String oHP1 = memberList.get(0).getUserPh1().substring(0, 3);
		String oHP2 = memberList.get(0).getUserPh1().substring(3, 7);
		String oHP3 = memberList.get(0).getUserPh1().substring(7, 11);
		request.setAttribute("oHP1", oHP1);
		request.setAttribute("oHP2", oHP2);
		request.setAttribute("oHP3", oHP3);
		
		
		
	}
	
}
