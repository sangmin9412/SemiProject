package controller.backoffice.order;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.tribes.io.ListenCallback;

import controller.PageAction;
import model.DAO.GoodsOrderDAO;
import model.DTO.GoodsOrderDTO;


public class OrderListAction {
	public void execute(HttpServletRequest request) {
		String sort = request.getParameter("sort");
		String sortNum = null;
		if(sort.equals("new")) {
			sortNum = "1";
		}else if(sort.equals("ing")) {
			sortNum = "2";
		}else if(sort.equals("end")) {
			sortNum = "3";
		}
		
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int limit = 5;
		int limitPage = 10;
		
		GoodsOrderDAO dao = new GoodsOrderDAO();
		List<GoodsOrderDTO> list = dao.goodsOrderListSelect(page, limit, sortNum);
		Integer count = dao.goodsOrderCount();
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("limit", limit);
		request.setAttribute("sortVal", sort);
		
		
		PageAction pageAction = new PageAction();
		pageAction.page(request, count, limit, limitPage, page, "orderList.bogd");
		
 
		
	}
}
