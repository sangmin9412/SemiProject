package controller.partnerBo.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import controller.PageAction;
import model.DAO.PartnerOrderDAO;
import model.DTO.PartnerOrderDTO;

public class GoodsIbgoListAction {
	public void execute(HttpServletRequest request) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 5;
		int limitPage = 10;
		
		HttpSession session = request.getSession();
		
		String partnerNum = session.getAttribute("logId").toString();
		String bookNum = null;
		PartnerOrderDAO dao = new PartnerOrderDAO();
		List<PartnerOrderDTO> list = dao.partnerIbgoSelect(page, limit, bookNum, partnerNum);
		Integer count = dao.partnerIbgoCount();
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "goodsIpgo.bogd");

	}
}
