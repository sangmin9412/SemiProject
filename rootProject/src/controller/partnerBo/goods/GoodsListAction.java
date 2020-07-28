package controller.partnerBo.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		
		HttpSession session = request.getSession();
		String partnerNum = session.getAttribute("logId").toString();
		
		String bookNum = null;
		GoodsDAO dao = new GoodsDAO();
		List<GoodsDTO> list = dao.goodsPartnerSelect(page, limit, bookNum, partnerNum);
		Integer count = dao.goodsPartnerCount(partnerNum);
		request.setAttribute("goodsList", list);
		request.setAttribute("count", count);
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "goodsList.pogd");
		
	}
}
