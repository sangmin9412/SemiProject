package controller.main.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.GoodsDAO;

public class MemberCartQtyDownAction {
	public void execute(HttpServletRequest request) {
		String bookNum = request.getParameter("bookNum");
		String qty = request.getParameter("Qty");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("logId");
		GoodsDAO dao = new GoodsDAO(); 
		System.out.println(bookNum);
		if (qty.equals("1")) {
			return;
		}
		dao.cartQtyDown(bookNum, userId);
	}
}
