package controller.backoffice.faqBoard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FaqBoardController extends HttpServlet implements Servlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		if (command.equals("/backoffice/faqBoardList.bofb")) {
			FaqListAction action = new FaqListAction();
			action.execute(request);
			String path = "/backoffice/page/cscenter/faq_board_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/faqBoardView.bofb")) {
			FaqDetailAction action = new FaqDetailAction();
			action.execute(request);
			String path = "/backoffice/page/cscenter/faq_board_view.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/faqBoardForm.bofb")) {
			String path = "/backoffice/page/cscenter/faq_board_form.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/faqBoardWrite.bofb")) {
			FaqWriteAction action = new FaqWriteAction();
			action.execute(request);
			response.sendRedirect("faqBoardList.bofb");
			
		} else if (command.equals("/backoffice/faqBoardModify.bofb")) {
			FaqDetailAction action = new FaqDetailAction();
			action.execute(request);
			String path = "/backoffice/page/cscenter/faq_board_modify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/faqBoardModifyPro.bofb")) {
			FaqModifyAction action = new FaqModifyAction();
			String path = action.execute(request);
			response.sendRedirect(path);
			
		} else if (command.equals("/backoffice/faqBoardDelete.bofb")) {
			FaqDeleteAction action = new FaqDeleteAction();
			action.execute(request);
			response.sendRedirect("faqBoardList.bofb");
			
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
