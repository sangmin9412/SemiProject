package controller.backoffice.noticeBoard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NoticeBoardController extends HttpServlet implements Servlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		if (command.equals("/backoffice/noticeBoardList.bonb")) {
			NoticeListAction action = new NoticeListAction();
			action.execute(request);
			String path = "/backoffice/page/cscenter/notice_board_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/noticeBoardView.bonb")) {
			NoticeDetailAction action = new NoticeDetailAction();
			action.execute(request);
			String path = "/backoffice/page/cscenter/notice_board_view.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/noticeBoardForm.bonb")) {
			String path = "/backoffice/page/cscenter/notice_board_form.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/noticeBoardWrite.bonb")) {
			NoticeWriteAction action = new NoticeWriteAction();
			action.execute(request);
			response.sendRedirect("noticeBoardList.bonb");
			
		} else if (command.equals("/backoffice/noticeBoardModify.bonb")) {
			NoticeDetailAction action = new NoticeDetailAction();
			action.execute(request);
			String path = "/backoffice/page/cscenter/notice_board_modify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/noticeBoardModifyPro.bonb")) {
			NoticeModifyAction action = new NoticeModifyAction();
			String path = action.execute(request);
			response.sendRedirect(path);
			
		} else if (command.equals("/backoffice/noticeBoardDelete.bonb")) {
			NoticeDeleteAction action = new NoticeDeleteAction();
			action.execute(request);
			response.sendRedirect("noticeBoardList.bonb");
			
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
