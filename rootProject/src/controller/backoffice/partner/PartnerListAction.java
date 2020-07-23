package controller.backoffice.partner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.PartnerDAO;
import model.DTO.PartnerDTO;

public class PartnerListAction {
	public void execute(HttpServletRequest request) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		String partnerNum = null;
		PartnerDAO dao = new PartnerDAO();
		List<PartnerDTO> list = dao.partnerSelect(page, limit, partnerNum);
		Integer count = dao.partnerCount();
		request.setAttribute("partnerList", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "partnerList.bopt");
		
	}
}
