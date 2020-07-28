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
		int limit = 5;
		int limitPage = 10;
		
		String partnerName = request.getParameter("partnerName");
		
		String bookNum = null;
		GoodsDAO dao = new GoodsDAO();
		List<GoodsDTO> list2 = dao.goodsPnameSelect();
		Integer count = dao.goodsCount();
		List<GoodsDTO> list = null;
		if (request.getParameter("partnerName") != null) {
			request.setAttribute("pName", partnerName);
			list = dao.goodsPartnerSelect(page, limit, partnerName);
		} else {			
			list = dao.goodsSelect(page, limit, bookNum);
		}
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "goodsList.bogd");

	}
}
