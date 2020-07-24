package controller.backoffice.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.GoodsOrderDAO;
import model.DTO.GoodsOrderDTO;



public class OrderViewAction {
	public void execute(HttpServletRequest request) {
		String orderNum = request.getParameter("orderNum");
		GoodsOrderDAO dao = new GoodsOrderDAO();
		System.out.println(orderNum);
		List<GoodsOrderDTO> list = dao.goodsOrderSelect(1, 1, orderNum);
		request.setAttribute("list", list);
	}
}
