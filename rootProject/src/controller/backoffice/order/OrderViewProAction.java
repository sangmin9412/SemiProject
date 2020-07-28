package controller.backoffice.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.GoodsOrderDAO;
import model.DTO.GoodsOrderDTO;

public class OrderViewProAction {
	public void execute(HttpServletRequest request) {
		String orderNum = request.getParameter("orderNum");
		GoodsOrderDAO dao = new GoodsOrderDAO();
		List<GoodsOrderDTO> list = dao.goodsOrderShipping(orderNum);
		request.setAttribute("list", list);
		request.setAttribute("sortVal", request.getParameter("sort"));
		

	}
}
