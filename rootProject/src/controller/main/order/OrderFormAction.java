package controller.main.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.GoodsDAO;
import model.DAO.MemberDAO;
import model.DTO.GoodsDTO;
import model.DTO.MemberDTO;

public class OrderFormAction {

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
		
	}
	
}
