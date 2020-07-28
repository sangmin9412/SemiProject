package controller.main.answerBoard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AnswerController extends HttpServlet implements Servlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		if (command.equals("/cscenter/answerList.ab")) {
			AnswerListAction action = new AnswerListAction();
			action.execute(request);
			String path = "/main/cscenter/answer_board_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		} else if (command.equals("/cscenter/answerView.ab")) {
			AnswerDetailAction action = new AnswerDetailAction();
			action.execute(request);
			String path = "/main/cscenter/answer_board_view.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/cscenter/answerFormPro.ab")) {
			AnswerWriteAction action = new AnswerWriteAction();
			action.execute(request);
			response.sendRedirect("answerList.ab");
			
		} else if (command.equals("/cscenter/answerModify.ab")) {
			AnswerDetailAction action = new AnswerDetailAction();
			action.execute(request);
			String path = "/main/cscenter/answer_board_modify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/cscenter/answerModifyPro.ab")) {
			AnswerModifyAction action = new AnswerModifyAction();
			action.execute(request, response);
			
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
