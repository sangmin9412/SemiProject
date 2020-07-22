package controller.backoffice.partner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.PartnerDAO;
import model.DTO.PartnerDTO;

public class PartnerViewAction {
	public void execute(HttpServletRequest request) {
		String partnerNum = request.getParameter("partnerNum");
		PartnerDAO dao = new PartnerDAO();
		List<PartnerDTO> list = dao.partnerSelect(1, 1, partnerNum);
		request.setAttribute("list", list);
	}
}
