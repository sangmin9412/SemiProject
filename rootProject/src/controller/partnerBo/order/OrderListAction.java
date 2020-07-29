package controller.partnerBo.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import controller.PageAction;
import model.DAO.GoodsOrderDAO;
import model.DTO.GoodsOrderDTO;

public class OrderListAction {
	
	public void execute(HttpServletRequest request) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		HttpSession session = request.getSession();
		String partnerName = session.getAttribute("logName").toString();
		GoodsOrderDAO dao = new GoodsOrderDAO();
		List<GoodsOrderDTO> list = dao.goodsOrderPartnerSelect(page, limit, partnerName);
		int count = dao.goodsOrderPartnerCount(partnerName);
		request.setAttribute("orderList", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "orderList.pood");
		
	}
	
}
