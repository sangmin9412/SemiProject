package controller.main.order;

import javax.servlet.http.HttpServletRequest;

import model.DAO.GoodsOrderDAO;

public class OrderCancelAction {

	public void exeucte(HttpServletRequest request) {
		String bookName = request.getParameter("bookName");
		String orderNum = request.getParameter("orderNum");
		String orderQty = request.getParameter("orderQty");
		
		GoodsOrderDAO dao = new GoodsOrderDAO();
		dao.goodsOrderCancelUpdate(bookName, orderNum, orderQty);
		
	}
	
}