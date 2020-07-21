package controller.backoffice.partner;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import model.DAO.PartnerDAO;
import model.DTO.PartnerDTO;

public class PartnerDeleteAction {
	public void execute(HttpServletRequest request) {
		String partnerNum = request.getParameter("partnerNum");
		PartnerDAO dao = new PartnerDAO();
		PartnerDTO dto = dao.partnerSelect(1, 1, partnerNum).get(0);
		int i = dao.partnerDel(partnerNum);
		File file1 = null;
		File file2 = null;
		String path = request.getServletContext().getRealPath("/backoffice/page/partner/upload");
		if(i >= 1) {
			file1 = new File(path + "/" + dto.getBusinessRegistFile());
			file2 = new File(path + "/" + dto.getBankBookFile());
			if(file1.exists()) {
				file1.delete();
				file2.delete();
			}
		}
	}
	
}
