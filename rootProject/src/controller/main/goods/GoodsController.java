package controller.main.goods;

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
		if (command.equals("/goods/goodsList.gd")) {
			String path = "/main/goods/goods_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/goods/goodsView.gd")) {
			String path = "/main/goods/goods_view.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/goods/goodsList.gd")) {
			
			
		} else if (command.equals("/goods/goodsList.gd")) {
			
			
		} else if (command.equals("/goods/goodsList.gd")) {
			
			
		} else if (command.equals("/goods/goodsList.gd")) {
			
			
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
