package controller.backoffice.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.PartnerOrderDAO;
import model.DTO.PartnerOrderDTO;

public class GoodsIbgoModifyAction {
	public void execute(HttpServletRequest request) {
		String bookNum = request.getParameter("bookNum");
		PartnerOrderDAO dao = new PartnerOrderDAO();
		List<PartnerOrderDTO> list = dao.partnerIbgoSelect(1, 1, bookNum);
		request.setAttribute("list", list);
		
		
	}
}
