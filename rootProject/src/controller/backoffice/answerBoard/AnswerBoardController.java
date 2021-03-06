package controller.backoffice.answerBoard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AnswerBoardController extends HttpServlet implements Servlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		if (command.equals("/backoffice/answerBoardList.boab")) {
			AnswerListAction action = new AnswerListAction();
			action.execute(request);
			String path = "/backoffice/page/cscenter/ans_board_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/answerBoardView.boab")) {
			AnswerDetailAction action = new AnswerDetailAction();
			action.execute(request);
			String path = "/backoffice/page/cscenter/ans_board_view.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/answerBoardForm.boab")) {
			String path = "/backoffice/page/cscenter/ans_board_form.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/answerBoardWrite.boab")) {
			AnswerWriteAction action = new AnswerWriteAction();
			action.execute(request);
			response.sendRedirect("answerBoardList.boab");
			
		} else if (command.equals("/backoffice/answerBoardModify.boab")) {
			AnswerDetailAction action = new AnswerDetailAction();
			action.execute(request);
			String path = "/backoffice/page/cscenter/ans_board_modify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/answerBoardModifyPro.boab")) {
			AnswerModifyAction action = new AnswerModifyAction();
			action.execute(request, response);
			
		} else if (command.equals("/backoffice/answerBoardReply.boab")) {
			AnswerDetailAction action = new AnswerDetailAction();
			action.execute(request);
			String path = "/backoffice/page/cscenter/ans_board_reply.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/answerBoardReplyPro.boab")) {
			AnswerReplyAction action = new AnswerReplyAction();
			action.execute(request);
			response.sendRedirect("answerBoardList.boab");
			
		} else if (command.equals("/backoffice/answerBoardDelete.boab")) {
			AnswerDeleteAction action = new AnswerDeleteAction();
			String path = action.execute(request);
			response.sendRedirect(path);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
