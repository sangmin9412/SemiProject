package controller.main.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import controller.PageAction;
import model.DAO.GoodsDAO;
import model.DTO.GoodsDTO;

public class GoodsCatListAction {

	public void execute(HttpServletRequest request) {
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 5;
		int limitPage = 10;
		
		String bookCategory = request.getParameter("category");
		GoodsDAO dao = new GoodsDAO();
		List<GoodsDTO> list = dao.goodsCategorySelect(page, limitPage, bookCategory);
		Integer count = dao.goodsCategoryCount(bookCategory);
		request.setAttribute("bookCategory", bookCategory);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "goodsList.gd?category="+bookCategory+"&");
	}
		
}
