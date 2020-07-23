package controller.backoffice.goods;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import model.DAO.PartnerOrderDAO;
import model.DTO.PartnerOrderDTO;

public class GoodsIbgoModifyProAction {
	public void execute(HttpServletRequest request) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PartnerOrderDTO dto = new PartnerOrderDTO();
		
		dto.setPartnerName(request.getParameter("partnerName"));
		dto.setBookName(request.getParameter("bookName"));
		dto.setBookCount(request.getParameter("bookCount"));
		dto.setpOrderQty(request.getParameter("pOrderQty"));
		dto.setpOrderReQty(request.getParameter("pOrderReQty"));
		dto.setpOrderOkQty(request.getParameter("pOrderOkQty"));
		dto.setBookNum(request.getParameter("bookNum"));
		dto.setPartnerNum(request.getParameter("partnerNum"));
		dto.setpOrderNum(request.getParameter("pOrderNum"));
		
		PartnerOrderDAO dao = new PartnerOrderDAO();
		dao.pOrderReOkUpdate(dto);
		dao.bookCountUpdate(dto);
		
		
	}
}
