package controller.main.order;

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
		if (command.equals("/order/orderStep01.od")) {
			OrderFormAction action = new OrderFormAction();
			action.exeucte(request);
			String path = "/main/order/order_step_01.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/order/orderWrite.od")) {
			OrderInsertAction action = new OrderInsertAction();
			action.exeucte(request);
			response.sendRedirect("orderComplete.od");
			
		} else if (command.equals("/order/orderComplete.od")) {
			String path = "/main/order/order_complete.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/order/orderList.od")) {
			OrderListAction action = new OrderListAction();
			action.execute(request);
			String path = "/main/order/order_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/order/orderCancel.od")) {
			OrderCancelAction action = new OrderCancelAction();
			action.exeucte(request);
			response.sendRedirect("orderList.od");
			
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}