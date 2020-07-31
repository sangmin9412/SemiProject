package controller.backoffice.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.GoodsOrderDAO;
import model.DTO.GoodsOrderDTO;



public class OrderViewAction {
	public void execute(HttpServletRequest request) {
		String orderNum = request.getParameter("orderNum");
		String bookName= request.getParameter("bookName");
		GoodsOrderDAO dao = new GoodsOrderDAO();
		List<GoodsOrderDTO> list = dao.goodsOrderSelectView(1, 1, orderNum, bookName);
		request.setAttribute("list", list);
		request.setAttribute("sortVal", request.getParameter("sort"));
	}
}
