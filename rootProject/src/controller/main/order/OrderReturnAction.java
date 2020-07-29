package controller.main.order;

import javax.servlet.http.HttpServletRequest;

import model.DAO.GoodsOrderDAO;

public class OrderReturnAction {

	public void exeucte(HttpServletRequest request) {
		String bookName = request.getParameter("bookName");
		String orderNum = request.getParameter("orderNum");
		String returnSort = request.getParameter("returnSort");
		String orderQty = request.getParameter("orderQty");
		
		GoodsOrderDAO dao = new GoodsOrderDAO();
		dao.goodsOrderReturnUpdate(bookName, orderNum, returnSort, orderQty);
		
	}
	
}
