package controller.backoffice.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.PartnerOrderDAO;
import model.DTO.PartnerOrderDTO;

public class GoodsIbgoModifyAction {
	public void execute(HttpServletRequest request) {
		String pOrderNum = request.getParameter("pOrderNum");
		PartnerOrderDAO dao = new PartnerOrderDAO();
		List<PartnerOrderDTO> list = dao.partnerIbgoSelect(1, 1, pOrderNum);
		request.setAttribute("list", list);
		
		
	}
}
