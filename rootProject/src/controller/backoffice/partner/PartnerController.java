package controller.backoffice.partner;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PartnerController extends HttpServlet implements Servlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		if (command.equals("/backoffice/partnerForm.bopt")) {
			String path = "/backoffice/page/partner/partner_form.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		
		} else if (command.equals("/backoffice/partnerWrite.bopt")) {
			PartnerWriteAction action = new PartnerWriteAction();
			action.execute(request);
			response.sendRedirect("/backoffice/partnerList.bopt");
			
		} else if (command.equals("/backoffice/partnerList.bopt")) {
			PartnerListAction action = new PartnerListAction();
			action.execute(request);
			String path = "/backoffice/page/partner/partner_list.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/partnerView.bopt")) {
			PartnerViewAction action = new PartnerViewAction();
			action.execute(request);
			String path = "/backoffice/page/partner/partner_view.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/partnerModify.bopt")) {
			PartnerViewAction action = new PartnerViewAction();
			action.execute(request);
			String path = "/backoffice/page/partner/partner_modify.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else if (command.equals("/backoffice/partnerDelete.bopt")) {
			PartnerDeleteAction action = new PartnerDeleteAction();
			action.execute(request);
			response.sendRedirect("partnerList.bopt");
			
		} else if (command.equals("/backoffice/partnerModifyPro.bopt")) {
			PartnerModifyProAction action = new PartnerModifyProAction();
			String partnerNum = action.execute(request);
			response.sendRedirect("partnerView.bopt?partnerNum="+partnerNum);
			
		} else if (command.equals("/backoffice/partnerForm.bopt")) {
			
			
		} else if (command.equals("/backoffice/partnerForm.bopt")) {
			
			
		} else if (command.equals("/backoffice/partnerForm.bopt")) {
			
			
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
