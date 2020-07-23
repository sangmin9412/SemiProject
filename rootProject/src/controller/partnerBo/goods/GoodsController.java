package controller.partnerBo.goods;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoodsController extends HttpServlet implements Servlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		if (command.equals("/partnerBo/goodsList.pogd")) {
			GoodsListAction action = new GoodsListAction();
			action.execute(request);
			String path = "/partnerBo/page/goods/goods_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/partnerBo/goodsView.pogd")) {
			GoodsViewAction action = new GoodsViewAction();
			action.execute(request);
			String path = "/partnerBo/page/goods/goods_view.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/partnerBo/goodsForm.pogd")) {
			String path = "/partnerBo/page/goods/goods_form.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/partnerBo/goodsWrite.pogd")) {
			GoodsWriteAction action = new GoodsWriteAction();
			action.execute(request);
			response.sendRedirect("/partnerBo/goodsList.pogd");
			
		} else if (command.equals("/partnerBo/goodsModify.pogd"))  {
			GoodsViewAction action = new GoodsViewAction();
			action.execute(request);
			String path = "/partnerBo/page/goods/goods_modify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/partnerBo/goodsModifyPro.pogd")) {
			GoodsModifyProAction action = new GoodsModifyProAction();
			String bookNum = action.execute(request);
			response.sendRedirect("goodsView.pogd?bookNum="+bookNum);
			
		} else if (command.equals("/partnerBo/goodsDelete.pogd")) {
			GoodsDeleteAction action = new GoodsDeleteAction();
			action.execute(request);
			response.sendRedirect("goodsList.pogd");
			
		} else if (command.equals("/partnerBo/goodsInventoryList.pogd")) {
			String path = "/partnerBo/page/goods/goods_inventory.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/partnerBo/goodsInventoryForm.pogd")) {
			String path = "/partnerBo/page/goods/goods_inventory_form.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/partnerBo/goodsIpgo.pogd")) {
			String path = "/partnerBo/page/goods/goods_ipgo.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/partnerBo/goodsIpgoModify.pogd")) {
			String path = "/partnerBo/page/goods/goods_ipgo_modify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
