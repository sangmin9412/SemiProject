package controller.backoffice.goods;

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
		if (command.equals("/backoffice/goodsList.bogd")) {
			GoodsListAction action = new GoodsListAction();
			action.execute(request);
			String path = "/backoffice/page/goods/goods_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/goodsView.bogd")) {
			GoodsViewAction action = new GoodsViewAction();
			action.execute(request);
			String path = "/backoffice/page/goods/goods_view.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/goodsForm.bogd")) {
			String path = "/backoffice/page/goods/goods_form.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/goodsWrite.bogd")) {
			GoodsWriteAction action = new GoodsWriteAction();
			action.execute(request);
			response.sendRedirect("/backoffice/goodsList.bogd");
			
		} else if (command.equals("/backoffice/goodsModify.bogd"))  {
			GoodsViewAction action = new GoodsViewAction();
			action.execute(request);
			String path = "/backoffice/page/goods/goods_modify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/goodsModifyPro.bogd")) {
			GoodsModifyProAction action = new GoodsModifyProAction();
			String bookNum = action.execute(request);
			response.sendRedirect("goodsView.bogd?bookNum="+bookNum);
			
		} else if (command.equals("/backoffice/goodsInventoryList.bogd")) {
			String path = "/backoffice/page/goods/goods_inventory.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/goodsInventoryForm.bogd")) {
			String path = "/backoffice/page/goods/goods_inventory_form.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/goodsIpgo.bogd")) {
			String path = "/backoffice/page/goods/goods_ipgo.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/goodsIpgoModify.bogd")) {
			String path = "/backoffice/page/goods/goods_ipgo_modify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
