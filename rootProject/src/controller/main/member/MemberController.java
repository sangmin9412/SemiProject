package controller.main.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.mail.iap.Response;

public class MemberController extends HttpServlet implements Servlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		if (command.equals("/mem/memberForm.mem")) {
			String path = "/main/member/member_form.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/mem/memberFormPro.mem")) {
			MemberInsertAction action = new MemberInsertAction();
			action.execute(request, response);
			
		} else if (command.equals("/mem/memberIdchk.mem")) {
			MemberIdCheckAction action = new MemberIdCheckAction();
			action.execute(request, response);
			
		} else if (command.equals("/mem/memberModify.mem")) {
			MemberViewAction action = new MemberViewAction();
			action.execute(request);
			String path = "/main/member/member_modify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/mem/memberModifyPro.mem")) {
			MemberModifyProAction action = new MemberModifyProAction();
			action.execute(request, response);
			
		} else if (command.equals("/mem/memberFind.mem")) {
			
			
		} else if (command.equals("/mem/memberIdFind.mem")) {
			
			
		} else if (command.equals("/mem/memberPwFind.mem")) {
			
			
		} else if (command.equals("/mem/memberMyPage.mem")) {
			String path = "/main/member/member_mypage.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/mem/memberList.mem")) {
			
			
		} else if (command.equals("/mem/memberList.mem")) {
			
			
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse respose) throws ServletException, IOException {
		doGet(request, respose);
	}
	
}
