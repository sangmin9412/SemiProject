package controller.main.member;

import javax.servlet.http.HttpServletRequest;

import model.DAO.GoodsDAO;

public class MemberCartRemoveAction {
	public void execute(HttpServletRequest request) {
		String [] cartNum = request.getParameterValues("IsChoice");
		GoodsDAO dao = new GoodsDAO(); 
		dao.cartRemove(cartNum);
	}
}
