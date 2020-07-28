package controller.backoffice.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberController extends HttpServlet implements Servlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		if (command.equals("/backoffice/memberList.bomem")) {
			MemberListAction action = new MemberListAction();
			action.execute(request);
			String path = "/backoffice/page/member/member_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/memberForm.bomem")) {
			MemberInsertAction action = new MemberInsertAction();
			action.execute(request);
			response.sendRedirect("/backoffice/memberList.bomem");
			
		} else if (command.equals("/backoffice/memberView.bomem")) {
			MemberViewAction action = new MemberViewAction();
			action.execute(request);
			String path = "/backoffice/page/member/member_view.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/memberModify.bomem")) {
			MemberViewAction action = new MemberViewAction();
			action.execute(request);
			String path = "/backoffice/page/member/member_modify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/memberModifyPro.bomem")) {
			MemberModifyProAction action = new MemberModifyProAction();
			action.execute(request);
			response.sendRedirect("/backoffice/memberView.bomem");
			
		} else if (command.equals("/backoffice/memberDelete.bomem")) {
			MemberDeleteAction action = new MemberDeleteAction();
			action.execute(request);
			response.sendRedirect("/backoffice/memberList.bomem");
			
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
