package controller.backoffice.eventBoard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventBoardController extends HttpServlet implements Servlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		if (command.equals("/backoffice/eventBoardList.boeb")) {
			EventListAction action = new EventListAction();
			action.execute(request);
			String path = "/backoffice/page/cscenter/event_board_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/eventBoardView.boeb")) {
			EventDetailAction action = new EventDetailAction();
			action.execute(request);
			String path = "/backoffice/page/cscenter/event_board_view.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/eventBoardForm.boeb")) {
			String path = "/backoffice/page/cscenter/event_board_form.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/eventBoardWrite.boeb")) {
			EventWriteAction action = new EventWriteAction();
			action.execute(request);
			response.sendRedirect("eventBoardList.boeb");
			
		} else if (command.equals("/backoffice/eventBoardModify.boeb")) {
			EventDetailAction action = new EventDetailAction();
			action.execute(request);
			String path = "/backoffice/page/cscenter/event_board_modify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/eventBoardModifyPro.boeb")) {
			EventModifyAction action = new EventModifyAction();
			String path = action.execute(request);
			response.sendRedirect(path);
			
		} else if (command.equals("/backoffice/eventBoardDelete.boeb")) {
			EventDeleteAction action = new EventDeleteAction();
			action.execute(request);
			response.sendRedirect("eventBoardList.boeb");
			
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
