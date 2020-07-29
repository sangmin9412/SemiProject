package controller.main.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.GoodsOrderDAO;
import model.DTO.GoodsOrderDTO;

public class OrderListAction {

	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = session.getAttribute("logId").toString();
		GoodsOrderDAO dao = new GoodsOrderDAO();
		List<GoodsOrderDTO> list = dao.goodsOrderUserSelect(userId);
		request.setAttribute("orderList", list);
		
	}
	
}
