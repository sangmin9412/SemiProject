package controller.backoffice.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.GoodsOrderDAO;
import model.DTO.GoodsOrderDTO;

public class OrderViewReturnAction {
	public void execute(HttpServletRequest request) {
		String orderNum = request.getParameter("orderNum");
		String bookName = request.getParameter("bookName");
		GoodsOrderDAO dao = new GoodsOrderDAO();
		List<GoodsOrderDTO> list = dao.goodsOrderReturn(orderNum, bookName);
		request.setAttribute("list", list);
		request.setAttribute("sortVal", request.getParameter("sort"));
	}
}
