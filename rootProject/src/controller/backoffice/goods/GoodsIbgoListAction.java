package controller.backoffice.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.PartnerOrderDAO;
import model.DTO.PartnerOrderDTO;

public class GoodsIbgoListAction {
	public void execute(HttpServletRequest request) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		String bookNum = null;
		PartnerOrderDAO dao = new PartnerOrderDAO();
		List<PartnerOrderDTO> list = dao.partnerIbgoSelect(page, limit, bookNum);
		Integer count = dao.partnerIbgoCount();
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "goodsIpgo.bogd?");

	}
}
