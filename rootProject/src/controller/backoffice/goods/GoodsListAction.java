package controller.backoffice.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.GoodsDAO;
import model.DTO.GoodsDTO;

public class GoodsListAction {
	public void execute(HttpServletRequest request) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 10;
		int limitPage = 10;
		
		String partnerName = request.getParameter("partnerName");
		String serchValue = request.getParameter("serchValue");
		
		String bookNum = null;
		GoodsDAO dao = new GoodsDAO();
		List<GoodsDTO> list = null;
		if (request.getParameter("partnerName") != null) {
			request.setAttribute("pName", partnerName);
			list = dao.goodsListPartnerSelect(page, limit, partnerName, serchValue);
		} else {			
			list = dao.goodsSelect(page, limit, bookNum);
		}
		
		
		Integer count = dao.goodsCount();
		List<GoodsDTO> list2 = dao.goodsPnameSelect();
		request.setAttribute("list2", list2);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "goodsList.bogd?");

	}
}
