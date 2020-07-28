package controller.backoffice.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderController extends HttpServlet implements Servlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		if (command.equals("/backoffice/orderList.bood")) {
			OrderListAction action = new OrderListAction();
			action.execute(request);
			String path = "/backoffice/page/order/order_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/orderShippingList.bood")) {
			OrderListAction action = new OrderListAction();
			request.setAttribute("sort", "shipping");
			action.execute(request);
			String path = "/backoffice/page/order/order_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/orderCancelList.bood")) {
			request.setAttribute("sort", "cancel");
			String path = "/backoffice/page/order/order_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/orderReturnList.bood")) {
			request.setAttribute("sort", "return");
			String path = "/backoffice/page/order/order_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/orderView.bood")) {
			OrderViewAction action = new OrderViewAction();
			action.execute(request);
			String path = "/backoffice/page/order/order_view.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/orderViewPro.bood")) {
			OrderViewProAction action = new OrderViewProAction();
			action.execute(request);
			response.sendRedirect("/backoffice/orderView.bood");
			
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}
	
}
